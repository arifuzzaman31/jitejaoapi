<?php

namespace App\Http\Controllers;

use App\Helpers\AllStatic;
use App\Http\Resources\PaymentResource;
use App\Models\Coupon;
use App\Models\Payment;
use App\Models\User;
use App\Models\UserCoupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;
use Throwable;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.report.payment_report');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getReport(Request $request)
    {
        $payment = Payment::with('user')
            ->orderBy('id', 'desc');
        if ($request->keyword != '') {
            $payment = $payment->where('bank_transection_id', '=', $request->keyword);
            $payment = $payment->orWhere('transection_date_time', '=', $request->keyword);
            $payment = $payment->orWhere('card_no', '=', $request->keyword);
            $payment = $payment->orWhere('date', '=', $request->keyword);
            $payment = $payment->orWhere('user_id', '=', $request->keyword);
            $payment = $payment->orWhere('id', '=', $request->keyword);
        }
        if ($request->mode != '') {
            $payment = $payment->where('payment_mode', '=', $request->mode);
        }
        if ($request->status != '') {
            $payment = $payment->where('payment_status', '=', $request->status);
        }

        if ($request->date_range != '') {
            // return $request->date_range;

            $date    = preg_replace('/\s+/', '', explode('to', $request->date_range));
            $payment = $payment->whereBetween('date', [$date[0], $date[1]]);
            // return $payment->toSql();
        }

        $payment = $payment->paginate(10);

        return PaymentResource::collection($payment);
    }

    public function myPayment(Request $request)
    {
        $payment = Payment::where('user_id', '=', request()->user()->id)
            ->where('payment_status', '=', AllStatic::$paid)
            ->orderBy('id', 'desc')
            ->paginate(5);

        return PaymentResource::collection($payment);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'month'        => 'required',
            'total_charge' => 'required',
            'final_amount' => 'required',
        ]);

        try {
            $coupon_discount = 0;
            if ($request->coupon_code) {
                $coupon = Coupon::where(['id' => $request->coupon_id, 'coupon_code' => $request->coupon_code])->first();
                if ($coupon->amount_type == 1) {
                    $coupon_discount += $coupon->amount;
                } else {
                    $percentageAmount = (($request->before_coupon_amount * $coupon->amount) / 100);

                    // if percentage greater then maiximum amount
                    if ($percentageAmount > $coupon->max_amount_limit) {
                        $coupon_discount += $coupon->max_amount_limit;
                    } else {
                        $coupon_discount += $percentageAmount;
                    }
                }
            }

            // return $coupon_discount;
            // all calculation

            // saving payment
            $payment                        = new Payment;
            $payment->user_id               = request()->user()->id;
            $payment->total_month           = $request->month;
            $payment->coupon_id             = $request->coupon_id;
            $payment->coupon_code           = $request->coupon_code;
            $payment->amount_per_month      = round(($request->total_charge / $request->month), 2);
            $payment->total_amount          = $request->total_charge;
            $payment->discount_for_month    = $request->primary_discount;
            $payment->coupon_discount       = round($coupon_discount, 2);
            $payment->total_discount        = $coupon_discount + $request->primary_discount;
            $payment->subscription_plan_id  = $request->package_id;
            $payment->final_amount          = $request->total_charge - $payment->total_discount;
            $payment->payment_mode          = 1;
            $payment->date                  = date('Y-m-d');
            $payment->transection_date_time = date('Y-m-d H:i:s');
            $payment->save();

            // ssl commerz payment

            return response()->json(['status' => 'success', 'message' => 'payment created', 'order' => $payment], 200);

        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }
    }

    public function getUnpaidPayment($id)
    {
        $paid    = 1;
        $payment = Payment::find($id);
        if ($payment->payment_status == $paid) {
            return response()->json(['status' => 'error', 'message' => 'এই পেমেন্ট অলরেডি পেইড'], 400);
        } else {
            return $payment;
        }

    }

    public function payOnline(Request $request)
    {

        $payment = Payment::with(['user', 'user.area'])->find($request->order);

        if ($payment->payment_status == 1) {

            return json_encode(['status' => 'fail', 'data' => null, 'message' => "Already Paid!"]);
        }

        $post_data                 = array();
        $post_data['store_id']     = 'limme601b86f8e6dd4';
        $post_data['store_passwd'] = 'limme601b86f8e6dd4@ssl';
        $post_data['total_amount'] = (int)($payment->final_amount);
        $post_data['currency']     = "BDT";
        $post_data['tran_id']      = $payment->id;
        $post_data['success_url']  = route('ssl.success');
        $post_data['fail_url']     = config('app.front_url')."/dashboard/?success=failed";
        $post_data['cancel_url']   = config('app.front_url')."/dashboard/?success=canceled";

# CUSTOMER INFORMATION
        $post_data['cus_name']     = $payment->user->name;
        $post_data['cus_email']    = "jitejao@gmail.com";
        $post_data['cus_add1']     = $payment->user->area->area_name;
        $post_data['cus_add2']     = $payment->user->area->area_name;
        $post_data['cus_city']     = $payment->user->area->area_name;
        $post_data['cus_state']    = $payment->user->area->area_name;
        $post_data['cus_postcode'] = "1000";
        $post_data['cus_country']  = "Bangladesh";
        $post_data['cus_phone']    = $payment->user->mobile_no;
        $post_data['cus_fax']      = "";

# SHIPMENT INFORMATION
        $post_data['ship_name']       = "JITEJAO";
        $post_data['shipping_method'] = "NO";
        $post_data['ship_add1 ']      = "Dhaka";
        $post_data['ship_add2']       = "Dhaka";
        $post_data['ship_city']       = "Dhaka";
        $post_data['ship_state']      = "Dhaka";
        $post_data['ship_postcode']   = "1000";
        $post_data['ship_country']    = "Bangladesh";

# OPTIONAL PARAMETERS
        $post_data['value_a']  = "ref001";
        $post_data['value_b '] = "ref002";
        $post_data['value_c']  = "ref003";
        $post_data['value_d']  = "ref004";

# EMI STATUS
        $post_data['emi_option'] = "1";

# CART PARAMETERS
        $post_data['cart'] = json_encode(array(
            array("product" => "subscription payment in jitejao", "amount" => (int)$payment->final_amount),
        ));
        $post_data['product_name'] = json_encode(['product' => "BID Pyamnet for some month", "amount" => (int)$payment->final_amount]);

        $post_data['product_category'] = "online shop";
        $post_data['product_profile']  = "general";

        $post_data['product_amount']  = (int)$payment->final_amount;
        $post_data['vat']             = "0";
        $post_data['discount_amount'] = "0";
        $post_data['convenience_fee'] = "0";

//$post_data['allowed_bin'] = "3,4";
        //$post_data['allowed_bin'] = "470661";
        //$post_data['allowed_bin'] = "470661,376947";

# REQUEST SEND TO SSLCOMMERZ
        if (config('app.payment_mode') == 'sandbox') {
            $direct_api_url = "https://sandbox.sslcommerz.com/gwprocess/v4/api.php";
        } else {
            $direct_api_url = "https://securepay.sslcommerz.com/gwprocess/v4/api.php";
        }

        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $direct_api_url);
        curl_setopt($handle, CURLOPT_TIMEOUT, 30);
        curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($handle, CURLOPT_POST, 1);
        curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC

        $content = curl_exec($handle);

        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if ($code == 200 && !(curl_errno($handle))) {
            curl_close($handle);
            $sslcommerzResponse = $content;
        } else {
            curl_close($handle);
            echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
            exit;
        }

# PARSE THE JSON RESPONSE
        $sslcz = json_decode($sslcommerzResponse, true);

//var_dump($sslcz); exit;

        if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] != "") {
            // this is important to show the popup, return or echo to sent json response back
            return json_encode(['status' => 'success', 'data' => $sslcz['GatewayPageURL'], 'logo' => $sslcz['storeLogo']]);
        } else {
            return $sslcz;
            return response()->json((['status' => 'fail', 'data' => null, 'message' => "something went wrong!"]));
        }
    }

    public function paymentSuccess(Request $request)
    {
        if ($request->status == "VALID") {
            try
            {
                DB::beginTransaction();
                $payment = Payment::find($request->tran_id);

                if ($payment->payment_status == 1) {

                    return redirect(config('app.front_url').'/dashboard/payment?payment=already_paid');
                }

                $user = User::find($payment->user_id);
                // calculate date to extends
                $extend_from = date('Y-m-d');
                if ($user->subscription_expired_at && $user->subscription_expired_at > $extend_from) {

                    $extend_from = $user->subscription_expired_at;
                }

                $extend_to = date('Y-m-d', strtotime("+$payment->total_month months", strtotime($extend_from)));

                $payment->payment_status             = 1;
                $payment->transection_status         = $request->status;
                $payment->transection_done_date_time = $request->tran_date;
                $payment->extend_from_date           = $extend_from;
                $payment->extend_to_date             = $extend_to;
                $payment->card_type                  = $request->card_type;
                $payment->card_no                    = $request->card_no;
                $payment->bank_transection_id        = $request->bank_tran_id;
                $payment->validation_id              = $request->val_id;
                $payment->update();

                $user->subscription_expired_at = $extend_to;
                $user->update();

                $usercoupon = UserCoupon::where(['user_id' => $payment->user_id, 'coupon_code' => $payment->coupon_code])->first();
                if ($usercoupon) {
                    $usercoupon->is_used = 1;
                    $usercoupon->update();
                }

                DB::commit();

                return redirect(config('app.front_url').'/dashboard/payment?payment=success');

            } catch (\Throwable $th) {
                // return $th;
                DB::rollBack();
                return response()->json(['status' => 'error', 'message' => 'something went wrong'], 400);
            }

        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function getPrinfPdf(Request $request)
    {
        $payment = Payment::with('user')
            ->orderBy('id', 'desc');
        if ($request->keyword != '') {
            $payment = $payment->where('bank_transection_id', '=', $request->keyword);
            $payment = $payment->orWhere('transection_date_time', '=', $request->keyword);
            $payment = $payment->orWhere('card_no', '=', $request->keyword);
            $payment = $payment->orWhere('date', '=', $request->keyword);
        }
        if ($request->mode != '') {
            $payment = $payment->where('payment_mode', '=', $request->mode);
        }
        if ($request->status != '') {
            $payment = $payment->where('payment_status', '=', $request->status);
        }

        if ($request->date_range != '') {

            $date    = preg_replace('/\s+/', '', explode('to', $request->date_range));
            $payment = $payment->whereBetween('date', [$date[0], $date[1]]);
        }
        $payment = $payment->get();

        if ($request->action == 'pdf') {
            // return view('admin.report.pdf.paymentportpdf',['payments' => $payment]);
            $pdf = PDF::loadView('admin.report.pdf.paymentportpdf', ['payments' => $payment]);

            $pdf->setPaper('A4', 'landscape');
            return $pdf->download("payment-report-Pdf.pdf");
        } else {
            return view('admin.report.print.paymentportprint', ['payments' => $payment]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment, $id)
    {
        $pay = $payment->with('user', 'admin')->find($id);
        return new PaymentResource($pay);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment, $id)
    {
        try {

            $payment                         = $payment->find($id);
            $payment->offline_payment_method = $request->offline_payment_method;
            $payment->transection_status     = $request->transection_status;
            $payment->payment_status         = $request->payment_status;
            $payment->admin_id               = \Auth::id();
            $payment->payment_mode           = AllStatic::$offline_pay;
            $payment->date                   = date('Y-m-d');
            $payment->transection_date_time  = date('Y-m-d H:i:s');
            $payment->update();
            return response()->json(['status' => 'success', 'message' => 'Payment data Updated !']);
        } catch (\Throwable $th) {
            // return $th;
            return response()->json(['status' => 'error', 'message' => 'something went wrong']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        //
    }
}
