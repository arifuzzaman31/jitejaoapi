<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repository\Customer\UserRepository;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Demand\Demand;
use App\Models\Bid\Bid;
use App\Helpers\AllStatic;
use App\Models\Payment;
use App\Models\Points;
use Illuminate\Support\Facades\Auth;
use Throwable;

class CustomerController extends Controller
{
	private $userRepo;

	public function __construct(UserRepository $userReposi)
	{
		$this->userRepo = $userReposi;
	}

    public function getUser()
    {

        return $user = User::all();

    }

    public function buyerList()
    {
    	return view('admin.customer.buyer');
    }

    public function getBuyer(Request $request)
    {
    	$buyer_list = $this->userRepo->getBuyerWithArea($request);
        // dd($buyer_list);
        return  UserResource::collection($buyer_list);
    }

    public function getSeller(Request $request)
    {
    	$seller_list = $this->userRepo->getSellerWithArea($request);
        // dd($seller_list);
        return  UserResource::collection($seller_list);
    }

    public function update(Request $request,$id)
    {
        // return $request->all();
        try {
           $user = User::find($id);
           $user->seller_badge = $request->seller_badge;
           $user->buyer_badge = $request->buyer_badge;
           $user->is_seller = $request->is_seller;
           if($request->is_seller == 1){
            $user->is_seller_before = 1;
           }
           $user->post_permission = $request->post_permission;
           $user->bid_permission = $request->bid_permission;
           $user->subscription_expired_at = $request->subscription_expired_at;
           $user->status = $request->status;
           $user->update();
           return response()->json(['status' => 'success', 'message' => 'Customer Updated !']);
            
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
        // return $id;
    }

    public function storeExpireDate(Request $request,$id)
    {
        // return $request->all();
        try {
           $user = User::find($id);
           $user->subscription_expired_at = $request->extend_expired_date;
           $user->update();
           return response()->json(['status' => 'success', 'message' => 'Expire Date Updated !']);
            
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
        // return $id;
    }

    public function sellerList()
    {
    	return view('admin.customer.seller');
    }

    public function show(User $user,$id)
    {
        $user = User::with(['user_information','area'])->find($id);
        return (new UserResource($user));
    }

    public function getUserByid(User $user,$id)
    {
        return $user = User::find($id);
    }

    public function getSubsDate(User $user,$id)
    {
        return new UserResource($user->find($id));
    }

    // public function getUserInfo(User $user,$id)
    // {
    //     return new UserResource($user->find($id));
    // }

    public function updateExpireDate(Request $request)
    {

        try {
            DB::beginTransaction();
            $user = User::find($request->id);

            $extend_date = $request->plan['total_month'];
            $user_date = ($user->subscription_expired_at == null) || ($user->subscription_expired_at < date('Y-m-d')) ? date('Y-m-d') : $user->subscription_expired_at;

            $final_date = date("Y-m-d",strtotime($user_date."+$extend_date month"));
            
                $payment = new Payment();
                $payment->user_id = $user->id;
                $payment->total_amount = $request->total_amount;
                $payment->total_month = $request->plan['total_month'];
                $payment->amount_per_month = round(($payment->total_amount / $payment->total_month),2);
                $payment->total_discount = $request->plan['discount'];
                $payment->subscription_plan_id = $request->plan['id'];
                $payment->final_amount = $request->final_amount;
                $payment->payment_mode = 2;
                $payment->transection_date_time = date('Y-m-d H:i:s');
                $payment->transection_done_date_time = date('Y-m-d H:i:s');
                $payment->transection_status = 'VALID';
                $payment->admin_id = Auth::guard('admin')->user()->id;
                $payment->offline_payment_method = $request->payment_method;
                $payment->date = date('Y-m-d');
                $payment->extend_from_date = $user->subscription_expired_at;
                $payment->extend_to_date = $final_date;
                $payment->payment_status = AllStatic::$paid;
                $payment->save();

                
                $user->subscription_expired_at = $final_date;
                $user->update();

                DB::commit();
                return response()->json(['status' => 'success', 'message' => 'Expired Date Updated !']);

           DB::rollBack(); 
            
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
        
    }

    public function addMorePoint(Request $request)
    {
        // return $request->all();
        try {

            DB::beginTransaction();
                $user = User::find($request->id);
                $payment = new Points();


                $payment->user_id               = $request->id;
                $payment->payment_status        = 1;
                $payment->total_amount          = $request->point;
                $payment->transection_status    = 'VALID';
                $payment->total_points          = $request->point;
                $payment->payment_mode          = 2;
                $payment->date                  = date('Y-m-d');
                $payment->transection_date_time = date('Y-m-d H:i:s');
                $payment->transection_done_date_time = date('Y-m-d H:i:s');
                $payment->offline_payment_method = $request->payment_method;
   
                $payment->save();

                $user->current_point += $payment->total_points;
                $user->update();

                DB::commit();
                return response()->json(['status' => 'success', 'message' => 'Point Added !']);

           DB::rollBack(); 
            
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
    }

    public function getBuyerDemand(Request $request, $id)
    {
        try {
            
            $demand = Demand::with('user:id,name','category:id,english_name','quantity_unit:id,english_name')->where('user_id',$id);
                    if($request->keyword != '')
                    {
                        $demand = $demand->where('title','LIKE','%'.$request->keyword.'%');
                        $demand = $demand->orWhere('expire_date','LIKE','%'.$request->keyword.'%');
                    }
            $demand = $demand->paginate(10);
             return $demand;
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
    }

    public function getSellerBid(Request $request, $id)
    {
        try {
            return Bid::with('demand.user:id,name','user:id,name')->where('user_id',$id)->paginate(10);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
            
        }
    }

    public function destroy(User $user,$id)
    {
        $user = $user->find($id);
        $user->delete();
        return response()->json(['status' => 'success', 'message' => 'Customer deleted !']);
    }
}
