<?php

namespace App\Http\Controllers;

use App\Helpers\AllStatic;
use App\Http\Resources\PointResource;
use App\Models\Points;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
// use Intervention\Image\Point;

class PointsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function myRecharge()
    {
        $payment = Points::where('user_id', '=', request()->user()->id)
            ->where('payment_status', '=', AllStatic::$paid)
            ->orderBy('id', 'desc')
            ->paginate(5);

        return PointResource::collection($payment);
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
            'points' => 'required',
        ]);

        try {

            // saving payment
            $payment               = new Points();
            $payment->user_id      = request()->user()->id;
            $payment->total_points = $request->points;
            $payment->total_amount = $request->points;
            // $payment->final_amount          = $request->points;
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

    public function payOnline(Request $request)
    {

        $payment = Points::with(['user', 'user.area'])->find($request->order);

        if ($payment->payment_status == 1) {

            return json_encode(['status' => 'fail', 'data' => null, 'message' => "Already Paid!"]);
        }

        $post_data                 = array();
        $post_data['store_id']     = 'limme601b86f8e6dd4';
        $post_data['store_passwd'] = 'limme601b86f8e6dd4@ssl';
        $post_data['total_amount'] = $payment->total_amount;
        $post_data['currency']     = "BDT";
        $post_data['tran_id']      = $payment->id;
        $post_data['success_url']  = route('ssl.success.point');
        $post_data['fail_url']     = config('app.front_url')."/dashboard/point?success=failed";
        $post_data['cancel_url']   = config('app.front_url')."/dashboard/point?success=canceled";

# CUSTOMER INFORMATION
        $post_data['cus_name']     = $payment->user->name;
        $post_data['cus_email']    = $payment->user->email ? $payment->user->email : "email@jitejao.com";
        $post_data['cus_add1']     = $payment->user->area->area_name;
        $post_data['cus_add2']     = $payment->user->area->area_name;
        $post_data['cus_city']     = $payment->user->area->area_name;
        $post_data['cus_state']    = $payment->user->area->area_name;
        $post_data['cus_postcode'] = "1000";
        $post_data['cus_country']  = "Bangladesh";
        $post_data['cus_phone']    = $payment->user->mobile_no;
        $post_data['cus_fax']      = "";

# SHIPMENT INFORMATION
        $post_data['ship_name']       = "JiteJao";
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
            array("product" => "Subscription payment in JiteJao", "amount" => $payment->total_amount),
        ));
        $post_data['product_name'] = json_encode(['product' => "BID Pyamnet for some month", "amount" => $payment->total_amount]);

        $post_data['product_category'] = "online shop";
        $post_data['product_profile']  = "general";

        $post_data['product_amount']  = $payment->total_amount;
        $post_data['vat']             = "0";
        $post_data['discount_amount'] = "0";
        $post_data['convenience_fee'] = "0";

//$post_data['allowed_bin'] = "3,4";
        //$post_data['allowed_bin'] = "470661";
        //$post_data['allowed_bin'] = "470661,376947";

# REQUEST SEND TO SSLCOMMERZ
            $direct_api_url = "https://sandbox.sslcommerz.com/gwprocess/v4/api.php";
        // if (env('PAYMENT_MODE') == 'sandbox') {
        // } else {
        //     $direct_api_url = "https://securepay.sslcommerz.com/gwprocess/v4/api.php";
        // }

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
                $payment = Points::find($request->tran_id);

                if ($payment->payment_status == 1) {

                    return redirect(config('app.front_url').'/dashboard/payment?type=point&payment=already_paid');
                }

                $user = User::find($payment->user_id);

                $payment->payment_status             = 1;
                $payment->transection_status         = $request->status;
                $payment->transection_done_date_time = $request->tran_date;
                $payment->card_type                  = $request->card_type;
                $payment->card_no                    = $request->card_no;
                $payment->bank_transection_id        = $request->bank_tran_id;
                $payment->validation_id              = $request->val_id;
                $payment->update();

                $user->current_point += $payment->total_points;
                $user->update();

                DB::commit();

                return redirect(config('app.front_url').'/dashboard/payment?type=point&payment=success');

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
     * @param  \App\Models\Points  $points
     * @return \Illuminate\Http\Response
     */
    public function show(Points $points)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Points  $points
     * @return \Illuminate\Http\Response
     */
    public function edit(Points $points)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Points  $points
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Points $points)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Points  $points
     * @return \Illuminate\Http\Response
     */
    public function destroy(Points $points)
    {
        //
    }
}
