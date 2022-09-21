<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserCoupon;
use App\Models\Coupon;
use App\Models\User;
use App\Models\Location\Area;
use App\Helpers\AllStatic;
use App\Sms\AdnSms;

class SendCouponController extends Controller
{
    public function index()
    {
    	$users = User::with('area')->where('is_seller','=', AllStatic::$seller)->get();
        $coupons = Coupon::select('id','coupon_code','valid_date')->get();
        $locations = Area::select('id','area_name')->get();
        return view('admin.offers.coupon.send_coupon',['coupon' => $coupons, 'location' => $locations, 'user' => $users]);
    }

    public function userCouponList(Request $request)
    {
    	// return "heu";
    	$coupon = UserCoupon::with('user')
                    ->where('valid_date', '>', date('Y-m-d'))
                    ->orderBy('created_at','desc');

        if ($request->keyword != '')
         {
             $coupon->Where('coupon_code','LIKE','%'.$request->keyword.'%');
             $coupon->orWhere('user_id','LIKE','%'.$request->keyword.'%');
         }
        // return $coupon->get();
        return $coupon->paginate(10);
    }

    public function store(Request $request)
    {
        $request->validate([
            'user'   => 'required',
            'coupon' => 'required'
        ]);
        try {
                $chk_user = UserCoupon::where('user_id','=', $request->user)->where('valid_date','>=',date('Y-m-d'))->first();
                if($chk_user){
                    return response()->json([
                        'status'  => 'warning',
                        'message' => 'User Already have Coupon!'
                    ]);
                }

                $coupon = new UserCoupon;
                $coupon->user_id = $request->user;
                $coupon->coupon_code = $request->coupon['coupon_code'];
                $coupon->valid_date = $request->coupon['valid_date'];
                $coupon->is_used = 0;
                $coupon->is_applied = 0;
                $coupon->save();

            $user = User::find($request->user);
            if($user->mobile_no){

                $message = "Congrats! You are get coupon $coupon->coupon_code from ".config('app.front_url')." valid $coupon->valid_date. visit : ".config('app.front_url');

                // sending sms using adn sms api
                $phone = $user->mobile_no;
                // $phoneno = implode(',',$phone);
                // AdnSms::sendSingleSms($phone, $message, 'TEXT');
            }
                
            return response()->json([
                'status'  => 'success',
                'message' => 'Coupon Sending Successfull !'
            ]);
            
        } catch (\Throwable $th) {
            return response()->json([
                'status'  => 'error',
                'message' => $th->getMessage()
            ]);
        }
    }

    public function destroy(UserCoupon $user_coupon,$id)
    {
        $usercoupon = $user_coupon->find($id);
        try { 
            $delete = $usercoupon->delete();
            if($delete){
                return response()->json([
                    'status'  => 'success',
                    'message' => 'User Coupon Deleted !'
                ]);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'status'  => 'error',
                'message' => $th->getMessage()
            ]);
        }
    }
}
