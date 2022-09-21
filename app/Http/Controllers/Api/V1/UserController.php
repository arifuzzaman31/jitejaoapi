<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\BuyerRatingResource;
use App\Http\Resources\SellerRatingResource;
use App\Http\Resources\UserResource;
use App\Http\Resources\NotificationResource;
use App\Models\Bid\Bid;
use App\Models\BuyerRating;
use App\Models\Demand\Demand;
use App\Models\Nilam;
use App\Models\NilamBid;
use App\Models\Notification;
use App\Models\SellerRating;
use App\Models\User;
use App\Models\User\UserInformation;
use Illuminate\Http\Request;
use Image;

class UserController extends Controller
{

    public function update(Request $request)
    {
        $user_id = request()->user()->id;

        $request->validate([
            // 'number' => 'required|unique:users,mobile_no,' . $user_id,
            'email' => 'nullable|email|regex:/(.*)@*\.com/i|unique:users,email,' . $user_id,
        ]);

        try {
            $user        = User::find($user_id);
            $user->name  = $request->name;
            $user->email = $request->email;
            // $user->mobile_no = $request->number;
            // if ($request->is_seller) {
            //     if ($user->is_seller_before == 0) {
            //         $user->subscription_expired_at = date('Y-m-d', strtotime('+7 days'));
            //     }

            //     $user->is_seller_before = 1;

            // }

            // $user->is_seller = $request->is_seller ? 1 : 0;

            $user->is_seller = 1;
            $user->is_seller_before = 1;

            if ($request->category) {
                $catIds = [];
                foreach ($request->category as $value) {
                    // return $value['id'];
                    $catIds[] = $value['id'];
                }
                // dd($catIds);
                $user->category()->sync($catIds);
            }

            if ($request->area) {
                $user->area_id = $request->area['id'];
            }

            $image_extension = 'jpeg';
            $profile_image   = $request->input('new_avatar');

            $image_height = 100;

            if ($profile_image) {
                if (file_exists('images/avatar/' . $user->avatar) && ($user->avatar != null)) {
                    // return 'avatar/'. $user->avatar;
                    \Storage::disk(currentFileSystem())->delete('avatar/' . $user->avatar);
                }
                // return "not if";
                $imageName  = date('Y-m-d') . '-' . time() . '.' . $image_extension;
                $image_file = Image::make($profile_image)->resize(null, $image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                \Storage::disk(currentFileSystem())->put('avatar/' . $imageName, $image_file);
                $user->avatar = $imageName;
            }

            $user->update();

            $user_info          = UserInformation::where('user_id', '=', $user_id)->first();
            $user_info->bio     = $request->description;
            $user_info->address = $request->address;
            $user_info->update();

            return response()->json(['status' => 'success', 'message' => 'Profile Successfully Updated !', 'user' => new UserResource(User::find($user_id))]);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }
    }

    public function getUser($user_id)
    {

        $user = User::with(['user_information', 'area'])
            ->select('id', 'name', 'avatar', 'area_id', 'average_saling_rating',
                'average_buying_rating', 'seller_badge', 'buyer_badge', 'is_seller', 'created_at')
            ->find($user_id);

        return new UserResource($user);

    }

    public function getCount()
    {
        $sevendays = date('Y-m-d', strtotime('-7 days'));
        $user_id = request()->user()->id;



        $demandCount = Demand::where('user_id', '=', $user_id)->count();
        $sevendaysDemandCount = Demand::where('user_id', '=', $user_id)
                ->whereBetween('created_at',[$sevendays, date('Y-m-d')])->count();
        // $nilamCount  = Nilam::where('user_id', '=', $user_id)->count();
        // $totalPost   = $demandCount + $nilamCount;
        $totalPost   = $demandCount;

        $demandBidCount = Bid::where('user_id', '=', $user_id)->count();
        $sevendaysBidCount = Bid::where('user_id', '=', $user_id)
                ->whereBetween('created_at',[$sevendays, date('Y-m-d')])->count();
        // $nilamBidCount  = NilamBid::where('user_id', '=', $user_id)->count();
        // $totalBid       = $demandBidCount + $nilamBidCount;
        $totalBid       = $demandBidCount;

        return response()->json(['totalPost' => $totalPost, 'totalBid' => $totalBid,
            'sevendaysDemand' => $sevendaysDemandCount,'sevendaysBid' => $sevendaysBidCount]);
    }

    public function getuserProfile()
    {
        $user = User::with('user_information', 'area', 'category')->find(request()->user()->id);
        return new UserResource($user);
    }

    public function reviewAsSeller($user_id)
    {

        $seller_rating = SellerRating::with(['reviewer:id,name,avatar', 'demand'])
            ->where('seller_id', '=', $user_id)
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        return SellerRatingResource::collection($seller_rating);

    }

    public function reviewAsBuyer($user_id)
    {
        $seller_rating = BuyerRating::with(['reviewer:id,name,avatar', 'demand'])
            ->where('buyer_id', '=', $user_id)
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        return BuyerRatingResource::collection($seller_rating);

    }

    public function getNotification(Request $request)
    {
        try {
            
            $perpage =  $request->input('per_page', 8);

            $page =  $request->input('page', 1);
            
            $notification = auth()->user()->notifications()->paginate($perpage, ['*'], 'page', $page);

            return NotificationResource::collection($notification)->additional(['meta' => [
                    'unread' => auth()->user()->unReadNotifications->count(),
                ]]);

            
        } catch (Throwable $e) {
            return response()->json('something went wrong',400);
        }
        
    }

    public function showNotification(Request $request)
    {
        try {
            $notification = auth()->user()->notifications->where('id', $request->id)->first();
            if ($notification) {
                $notification->markAsRead();
            }

            // return $notification->data;

            return response()->json($notification->data['details']['post_url'],200);

            // $notification = User::find(request()->user()->id)->notifications()->where('id', $id)->first();

            
        } catch (Throwable $e) {
            return response()->json('something went wrong',400);
        }
    }
    
    public function destroyNotification(Request $request,$id)
    {
        try {
            $notification = auth()->user()->notifications->where('id', $id)->first();
            if ($notification) {
                $notification->delete();
                return response()->json(['status' => 'success', 'message' => 'নোটিফিকেশন ডিলেট হয়েছে !'],200);
            }
            
        } catch (Throwable $e) {
            return response()->json('something went wrong',400);
        }
    }

}
