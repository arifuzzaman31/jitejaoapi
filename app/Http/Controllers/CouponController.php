<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\UserCoupon;
use Illuminate\Http\Request;
use App\Helpers\AllStatic;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.offers.coupon.coupon');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function couponList(Request $request)
    {
        $coupons = Coupon::orderBy('id','desc');
        
        if($request->assign != '')
        {
            $coupons = $coupons->where('coupon_type','!=',AllStatic::$active);
            $coupons = $coupons->where('valid_date','>=',date('Y-m-d'));
        }
        if($request->keyword != '')
        {
            $coupons = $coupons->where('coupon_code', 'LIKE', '%'.$request->keyword.'%');
            $coupons = $coupons->orWhere('valid_date', '=', $request->keyword);
        }

        if($request->status != '')
        {
            $coupons = $coupons->where('status', '=', $request->status);
        }
        return $coupons->paginate(10);
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
            'coupon_code' => 'required',
            'coupon_type' => 'required',
            'amount_type' => 'required',
            'maximum_amount' => 'required_if:amount_type,2',
            'amount' => 'required',
            'valid_date' => 'required',
        ]);

        try {
            $coupon = new Coupon;
            $coupon->coupon_code = $request->coupon_code;
            $coupon->coupon_type = $request->coupon_type;
            $coupon->amount_type = $request->amount_type;
            $coupon->amount      = $request->amount;
            $coupon->max_amount_limit = $request->maximum_amount;
            $coupon->valid_date  = date('Y-m-d', strtotime($request->valid_date));
            $coupon->status      = $request->status;
            $coupon->save();
            return response()->json(['status' => 'success', 'message' => 'New Coupon Created !']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'success', 'message' => $th->getMessage()]);
        }

    }

    public function userCoupon()
    { 
        $current_date = date('Y-m-d');

        $user_coupon = UserCoupon::where('valid_date','>=',$current_date)
                             ->where('user_id','=',request()->user()->id)
                             ->where('is_applied','=',1)
                             ->where('is_used','=',0)
                             ->first();
        
        if($user_coupon)
        {
            $coupon = Coupon::where('coupon_code','=',$user_coupon->coupon_code)
                             ->first();
            return $coupon;                 
        }

        return response()->json(['status'=>'error','message' => "No Coupon"]);

    }

    public function applyCoupon(Request $request)
    {
      $request->validate(['coupon_code' => 'required']);

      try
      {
           $current_date = date('Y-m-d');

            $code = Coupon::where('coupon_code',$request->coupon_code)
                    ->where('valid_date','>=',$current_date)
                    ->first();
           if(!empty($code) && $code->coupon_type == AllStatic::$for_all)
           {
                $chk_coupon = UserCoupon::where('coupon_code','=',$request->coupon_code)
                        ->where('user_id','=',request()->user()->id)
                        ->first();
                if($chk_coupon){
                    return response()->json(['status'=>'error','message'=>'Coupon Already Used']);
                }else{
                    $use_coupon = new UserCoupon();
                    $use_coupon->user_id = request()->user()->id;
                    $use_coupon->coupon_code = $request->coupon_code;
                    $use_coupon->valid_date = $code->valid_date;
                    $use_coupon->is_applied = 1;
                    $use_coupon->save();
                    return response()->json(['status'=>'success','message'=>'Coupon Applied']);
                }

           } else {

                $coupon = UserCoupon::where('coupon_code','=',$request->coupon_code)
                                    ->where('valid_date','>=',$current_date)
                                    ->where('user_id','=',request()->user()->id)
                                    ->first();
                //   if coupon exist 
        
                if($coupon)
                {
                    
                // if coupon already used 
        
                    if($coupon->is_used === 1)
                    { 
        
                        return response()->json(['status'=>'error','message'=>'Coupon Already Used']);
                    }
        
                    $update_coupon = UserCoupon::find($coupon->id);
                    $update_coupon->is_applied = 1;
                    $update_coupon->update();
                    return response()->json(['status'=>'success','message'=>'Coupon Applied']);
                }
                
                else
                {
                    return response()->json(['status'=>'error','message'=>'Invalid Code!']);
                }
           }

          
      }
      catch(\Throwable $e)
      {
        // return $e;
        return response()->json(['status'=>'error','message'=>$e->getMessage()]);

      }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function show(Coupon $coupon)
    {
        return $coupon;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function edit(Coupon $coupon)
    {
        return $coupon;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Coupon $coupon)
    {
        // check user coupon
        $request->validate([
            'coupon_code' => 'required',
            'coupon_type' => 'required',
            'amount_type' => 'required',
            'maximum_amount' => 'required_if:amount_type,2',
            'amount' => 'required',
            'valid_date' => 'required',
        ]);

        try {
            $coupon = $coupon->find($request->id);
            $coupon->coupon_code = $request->coupon_code;
            $coupon->coupon_type = $request->coupon_type;
            $coupon->amount_type = $request->amount_type;
            $coupon->amount      = $request->amount;
            $coupon->max_amount_limit = $request->maximum_amount;
            $coupon->valid_date  = date('Y-m-d', strtotime($request->valid_date));
            $coupon->status      = $request->status;
            $coupon->update();
            return response()->json(['status' => 'success', 'message' => 'Coupon Updated !']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'success', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function destroy(Coupon $coupon)
    {
        // check user coupon
        return $coupon;
    }
}
