<?php

namespace App\Http\Controllers;

use App\Helpers\AllStatic;
use App\Http\Resources\BidResource;
use App\Models\Bid\Bid;
use App\Models\BuyerRating;
use App\Models\Demand\Demand;
use App\Models\SellerRating;
use App\Models\Sms;
use App\Models\BidSetting;
use App\Models\User;
use App\Models\User\UserInformation;
use App\Repository\Bid\BidRepository;
use App\Sms\AdnSms;
use Illuminate\Support\Facades\Notification;
use App\Events\Notify;
use App\Notifications\BidOnDemandNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Image;
use Illuminate\Support\Str;
use Throwable;

class BidController extends Controller
{
    protected $bidRepo;

    public function __construct(BidRepository $bidRepo)
    {
        $this->bidRepo = $bidRepo;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function bidCountOnDemand($demand_id)
    {
        $remain_bid = 0;
        $shlist_bid = 0;
        $winner_bid = 0;
        
        $data = Bid::where('demand_id',$demand_id)->get();
        $remain_bid += $data->count();
        $shlist_bid += $data->where('is_shortlisted', '=', 1)->where('is_confirmed', '!=', 1)->count();
        $winner_bid += $data->where('is_confirmed', '=', 1)->count();
        
        return response()->json([
            'remain_bid' => $remain_bid,
            'shlist_bid' => $shlist_bid,
            'winner_bid' => $winner_bid
        ],200);
    }

    public function getBidByDemand(Request $request, $demand_id)
    {
        $per_page = $request->per_page ? $request->per_page : 10;
        $bids     = Bid::with(['user:id,area_id,name,mobile_no,email,avatar,average_saling_rating,seller_badge', 'user.area'])
            ->where('demand_id', $demand_id);
        // ->leftJoin('users', 'users.id', 'bids.user_id')
        // ->orderBy('users.average_saling_rating', 'asc')
        // ->orderBy('users.seller_badge', 'asc');
        // only for short listed
        if ($request->only_short_listed) {
            $bids->where('is_shortlisted', '=', 1);
        }

        if ($request->not_short_listed) {
            $bids->where('is_shortlisted', '=', 0);
        }

        if ($request->not_confirm) {
            $bids->where('is_confirmed', '=', 0);
        }

        if ($request->orderBy == 'lowest_price') {
            $bids->orderBy('offer_amount', 'asc');
        }
        if ($request->orderBy == 'heighest_price') {
            $bids->orderBy('offer_amount', 'desc');
        }
        if ($request->orderBy == 'recent_bid') {
            $bids->orderBy('created_at', 'desc');
        }
        if ($request->orderBy == 'old_bid') {
            $bids->orderBy('created_at', 'asc');
        }
        $bids = $bids->orderBy('is_confirmed', 'desc')->paginate($per_page);

        return BidResource::collection($bids);
    }

    public function getConfirmBid($demand_id)
    {
        $confirm_bid = Bid::with(['user', 'user.area', 'bid_rating'])
            ->where('is_confirmed', '=', AllStatic::$confirm)
            ->where('demand_id', $demand_id)->first();
        if ($confirm_bid) {
            return new BidResource($confirm_bid);
        } else {
            return null;
        }

    }

    // find a bidder infromation
    public function getBidder($bid_id)
    {
        $user = Bid::with(['user.area', 'user.user_information'])->find($bid_id);

        return new BidResource($user);
    }

    // find a bidder infromation
    public function confirmBid(Request $request, $bid_id)
    {
        try {
            DB::beginTransaction();
            $bid    = Bid::find($bid_id);
            $demand = Demand::find($bid->demand_id);
            if ($demand->bid_status != 0) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'আপনি অলরেডি একটি বিড কনফার্ম করেছেন',
                ], 400);
            }

            if ($demand->user_id != request()->user()->id) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই ডিম্যান্ড আপনার না ! ',
                ], 400);
            }
            // update bid
            $bid->is_confirmed   = 1;
            $bid->is_shortlisted = 1;
            $bid->confirmed_date = date('Y-m-d H:i:s');
            $bid->update();

            $demand->confirmed_to     = $bid->user_id;
            $demand->bid_status       = 1;
            $demand->confirmed_amount = $request->confirmed_amount;
            $demand->update();

            // send sms

            DB::commit();
            $demander = request()->user();
            $demander_picture = $demander->avatar ?  $demander->avatar : 'default/avatar.svg';
            $details = [
                'post_url' => '/demand/' . $bid->demand_id .'/'.uniqueString(),
                'apps_url' => '/demand/' . $bid->demand_id .'/'.uniqueString(),
                'type'  => 'demand',
                'demand_id'  => $bid->demand_id,
                'notification_message'  => 'Congrats! "'.Str::limit($demand->title,25,' ...').'" পোষ্টে আপনার বিড কনফার্ম হয়েছে',
                'bidder_id' => $demander->id,
                'bidder_name' => $demander->name,
                'bidder_avatar' => fileBaseUrl() .'/avatar/'. $demander_picture,
                'bidder_phone' => $demander->mobile_no
            ];
            //nofify the athor of bidder
            Notification::send($bid->user, new BidOnDemandNotification($details));

            $sms_setting = Sms::first();
            if (($sms_setting->confirm_bid_sms == 1) && ($sms_setting->status == 1)) {
                if ($demand->total_bid <= 1) {
                    $no      = $bid->user->mobile_no;
                    $message = "আপনার একটি বিড কনফার্ম হয়েছে ।" . config('app.front_url').'/dashboard/mybid';
                    AdnSms::sendSingleSms($no, $message, 'UNICODE');
                }
            }

            return response()->json([
                'status'  => 'success',
                'message' => 'ধন্যবাদ ! বিড কনফার্ম হয়েছে',
            ]);

        } catch (Throwable $th) {
            DB::rollBack();
            return response()->json([
                'status'  => 'error',
                'message' => 'something went wrong',
            ], 400);
        }

    }

    public function markAsDone(Request $request, $bid_id)
    {
        $request->validate([
            'ratings' => 'required'
        ]);
        try {
            DB::beginTransaction();
            $bid    = Bid::find($bid_id);
            $demand = Demand::find($bid->demand_id);
            if ($demand->user_id != request()->user()->id) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই ডিম্যান্ড আপনার না ! ',
                ], 400);
            }

            if ($demand->is_done != 0) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই ডিমান্ডটি অলরেডি শেষ দেখিয়েছেন',
                ], 400);
            }

            $seller_rating              = new SellerRating;
            $seller_rating->bid_id      = $bid_id;
            $seller_rating->demand_id   = $demand->id;
            $seller_rating->reviewer_id = $demand->user_id;
            $seller_rating->seller_id   = $bid->user_id;
            $seller_rating->ratings     = $request->ratings;
            $seller_rating->review      = $request->review;
            $seller_rating->save();

            $bid->is_done_from_buyer = 1;
            $bid->is_done            = 1;
            $bid->is_buyer_reviewed  = 1;
            $bid->done_date          = date('Y-m-d H:i:s');
            $bid->update();

            $demand->is_done = 1;
            $demand->update();

            $average_rating = SellerRating::where('seller_id', '=', $bid->user_id)->avg('ratings');

            $user_info = UserInformation::where('user_id', '=', $bid->user_id)->first();
            $user_info->total_completed_work += 1;
            $user_info->update();

            $seller_badge = AllStatic::$sliver;
            if ($user_info->total_completed_work >= 10 && $user_info->total_completed_work < 50) {
                $seller_badge = AllStatic::$blue;
            }
            if ($user_info->total_completed_work >= 50) {
                $seller_badge = AllStatic::$pink;

            }

            $user                        = User::find($bid->user_id);
            $user->average_saling_rating = $average_rating;
            $user->seller_badge          = $seller_badge;
            $user->update();

            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'অভিনন্দন আপনার কাজ টি সম্পূর্ণ হয়েছে']);

        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    public function buyerReview(Request $request, $bid_id)
    {
        $request->validate([
            'ratings' => 'required'
        ]);
        try {
            DB::beginTransaction();
            $bid    = Bid::find($bid_id);
            $demand = Demand::find($bid->demand_id);
            if ($bid->user_id != request()->user()->id) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই বিড আপনার না ! ',
                ], 400);
            }

            if ($demand->is_done != 1) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'বায়ার এখনো রিভিউ দেন নাই ',
                ], 400);
            }
            $count = BuyerRating::where('bid_id', '=', $bid_id)->count();
            if ($count > 0) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই বিড এর অলরেডি রিভিউ রয়েছে ',
                ], 400);
            }
            $seller_rating              = new BuyerRating;
            $seller_rating->bid_id      = $bid_id;
            $seller_rating->demand_id   = $bid->demand_id;
            $seller_rating->reviewer_id = $bid->user_id;
            $seller_rating->buyer_id    = $demand->user_id;
            $seller_rating->ratings     = $request->ratings;
            $seller_rating->review      = $request->review;
            $seller_rating->save();

            $bid->is_done_from_seller = 1;
            $bid->is_seller_reviewed  = 1;
            $bid->update();

            // $demand->is_done = 1;
            // $demand->update();

            $average_rating = BuyerRating::where('buyer_id', '=', $demand->user_id)->avg('ratings');

            $user_info = UserInformation::where('user_id', '=', $demand->user_id)->first();
            $user_info->total_worker_hired += 1;
            $user_info->update();

            // update user badge and rating
            $buyer_badge = AllStatic::$sliver;
            if ($user_info->total_worker_hired >= 10 && $user_info->total_worker_hired < 50) {
                $buyer_badge = AllStatic::$blue;
            }
            if ($user_info->total_worker_hired >= 50) {
                $buyer_badge = AllStatic::$pink;
            }

            $user                        = User::find($demand->user_id);
            $user->average_buying_rating = $average_rating;
            $user->buyer_badge           = $buyer_badge;
            $user->update();

            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'অভিনন্দন আপনার রিভিউ  টি সম্পূর্ণ হয়েছে']);

        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }
    }

    // get user bid

    public function myBid(Request $request)
    {
        $user_id = request()->user()->id;

        $bids = $this->bidRepo->userBids($request, $user_id);

        return BidResource::collection($bids);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkBid($demand_id)
    {
        $bidder = request()->user();
        $getBid = Bid::where(['user_id' => $bidder->id, 'demand_id' => $demand_id])->first();

        if ($getBid) {
            return response()->json([
                'status'  => 'error',
                'message' => 'আপনি অলরেডি এই ডিমান্ডে বিড করেছেন !',
            ], 400);
        } else {
            return response()->json([
                'status'  => 'success',
                'message' => 'Can Bid',
            ], 200);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $demand_id)
    {

        $request->validate([
            // 'proposal'     => 'required',
            'delivery_date'=> 'required',
            'offer_amount' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/|gte:0',
            'bid_image'    => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
        ]);
        try {
            DB::beginTransaction();
            $demand = Demand::find($demand_id);
            $bidder = request()->user();
            // if ($bidder->is_seller != AllStatic::$seller) {
            //     return response()->json([
            //         'status'  => 'error',
            //         'message' => 'আপনি সেলার হিসেবে রেজিস্টার করেননি বিড করার জন্যে সেলার হিসেবে আপনার প্রোফাইল আপডেট করুন',
            //     ], 400);
            // }
            if ($bidder->bid_permission != AllStatic::$active) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'আপনার বিড করা সাময়িক ভাবে ডিজেবল করা হয়েছে',
                ], 400);
            }
            
            if (date('Y-m-d') > $bidder->subscription_expired_at) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'আপনার সাবস্ক্রিপশন এর মেয়াদ শেষ অনুগ্রহ করে আপনার একাউন্ট থেকে  সাবস্ক্রিপশন  রিনিউ  করে নিন ',
                ], 400);
            }

            if (date('Y-m-d') > $demand->expire_date) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এই ডিম্যান্ডে আর বিড করা যাবেনা  ',
                ], 400);
            }

            if ($demand->user_id == $bidder->id) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'আপনি নিজের ডিম্যান্ড এ বিড করতে পারবেন না !',
                ], 400);
            }

            $getBid = Bid::where(['user_id' => $bidder->id, 'demand_id' => $demand_id])->first();

            if ($getBid) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'আপনি অলরেডি এই ডিমান্ডে বিড করেছেন !',
                ], 400);
            }

            // $bid_setting = BidSetting::first();
            // if ($bidder->current_point < $bid_setting->bid_charge) {
            //     return response()->json([
            //         'status'  => 'error',
            //         'message' => 'আপনার পর্যাপ্ত পয়েন্ট নেই। দয়া করে রিচার্জ করুন।',
            //     ], 400);
            // }

            $bid                       = new Bid();
            $bid->demand_id            = $demand_id;
            $bid->user_id              = $bidder->id;
            $bid->demander_id          = $demand->user_id;
            $bid->proposal_description = $request->proposal;
            $bid->work_link            = $request->work_link;
            $bid->work_due_date        = $request->delivery_date;
            $bid->bid_date             = date('Y-m-d');

            $image_extension = 'jpeg';
            $bid_image       = $request->input('bid_image');

            $image_height = 470;

            if ($bid_image) {
                $imageName  = date('Y-m-d') . '-' . time() . '.' . $image_extension;
                $image_file = \Image::make($bid_image)->resize(null, $image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('bid/big/' . $imageName, $image_file);

                $image_file = \Image::make($bid_image)->resize(null, 70, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('bid/small/' . $imageName, $image_file);

                $bid->bid_image = $imageName;
            }

            $bid->offer_amount_type = $request->offer_amount_type;
            $bid->offer_amount      = $request->offer_amount;
            $bid->status            = $request->status;
            $bid->save();

            if($demand->sms_status == 0){

                $sms_setting = Sms::first();
                if (($sms_setting->new_bid_sms == 1) && ($sms_setting->status == 1)) {
                    //send sms to demander for 1st bid
                    $no       = $demand->user->mobile_no;
                    $message  = "আপনার ডিমান্ডে বিড হয়েছে । জিতে যাও . ".config('app.front_url').'/demand/' . $demand->id . '/' . uniqueString();

                    AdnSms::sendSingleSms($no, $message, 'UNICODE');
                }
            }

            //Broadcast
            // broadcast(new Notify($bid));
                    // broadcast(new Notify($bid))->toOthers();
            $bidder_picture = $bidder->avatar ?  $bidder->avatar : 'default/avatar.svg';
            $details = [
                'post_url' => '/demand/' . $demand_id .'/'.uniqueString(),
                'apps_url' => '/demand/' . $demand_id .'/'.uniqueString(),
                'type'  => 'demand',
                'demand_id'  => $demand_id,
                'notification_message'  => 'আপনার "'.Str::limit($demand->title,25,' ...').'" পোষ্টে '.$bidder->name.' বিড করেছেন',
                'bidder_id' => $bidder->id,
                'bidder_name' => $bidder->name,
                'bidder_avatar' => fileBaseUrl() .'/avatar/'. $bidder_picture,
                'bidder_phone' => $bidder->mobile_no
            ];
            //nofify the athor of demand
            Notification::send($demand->user, new BidOnDemandNotification($details));
            // $demand->user->notify(new BidOnDemandNotification($details));
            // demand table update with bid
            $demand->total_bid += 1;
            $demand->sms_status = 1;
            $demand->update();

            // seller bid account update
            UserInformation::where('user_id', $bidder->id)->increment('total_bid');
            //cutting user point
            // $bidder->current_point = $bidder->current_point - $bid_setting->bid_charge;
            // $bidder->update();

            DB::commit();
            // return inserted bid
            $user_bid = Bid::with(['user:id,area_id,name,avatar,average_saling_rating,seller_badge', 'user.area'])
                ->find($bid->id);

            return response()->json([
                'status'  => 'success',
                'message' => 'বিড সাকসেসফুল!',
                'bid'     => new BidResource($user_bid),
            ], 200);

        } catch (\Throwable $th) {
            if($request->input('bid_image'))
            {
                $this->deleteImage($bid);
            }
            DB::rollBack();
            // return $th;
            return response()->json(['status' => 'error', 'message' => "Something went wrong!"], 400);
        }

    }

    public function toShortlist(Request $request, $bid_id)
    {

        try {
            $user   = request()->user();
            $listed = Bid::with('demand')->find($bid_id);

            if ($user->id == $listed->demand->user_id) {
                $result = $listed->is_shortlisted == 0 ? 1 : 0;

                $listed->is_shortlisted = $result;
                $listed->update();
                $message = $result == 0 ? 'বিড শর্টলিস্ট থেকে রিমোভ করা হয়েছে !' : 'বিড শর্টলিস্ট হয়েছে !';

                $bidder_picture = $listed->demand->user->avatar ?  $listed->demand->user->avatar : 'default/avatar.svg';
                $details = [
                    'post_url' => '/demand/' . $listed->demand->id .'/'.uniqueString(),
                    'apps_url' => '/demand/' . $listed->demand->id .'/'.uniqueString(),
                    'type'  => 'demand',
                    'demand_id'  => $listed->demand->id,
                    'notification_message'  => 'আপনাকে "'.Str::limit($listed->demand->title,25,' ...').'" পোষ্টে শর্টলিস্ট করা হয়েছে',
                    'bidder_id' => $listed->demand->user->id,
                    'bidder_name' => $listed->demand->user->name,
                    'bidder_avatar' => fileBaseUrl() .'/avatar/'. $bidder_picture,
                    'bidder_phone' => $listed->demand->user->mobile_no
                ];
                //nofify the athor of demand
                Notification::send($listed->user, new BidOnDemandNotification($details));

                return response()->json([
                    'status'  => 'success',
                    'message' => $message,
                ], 200);
            } else {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'এইটি আপনার পোষ্ট নয় !',
                ], 400);
            }

        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    public function getShortlistCustomer()
    {
        return Bid::where('is_shortlisted', '=', AllStatic::$active)->get();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Bid\Bid  $bid
     * @return \Illuminate\Http\Response
     */
    public function getBidByDemandId(Request $request, $demand_id)
    {
        $bid = $this->bidRepo->getBidByDemand($request, $demand_id);
        return BidResource::collection($bid);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Bid\Bid  $bid
     * @return \Illuminate\Http\Response
     */
    public function edit(Bid $bid, $id)
    {
        // $bid = $bid->find($id);
        // return new BidResource($bid);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Bid\Bid  $bid
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Bid $bid)
    {
        // return $request->all();
        $validator = \Validator::make($request->all(), [
            'delivery_date' => 'required',
            'offer_amount'  => 'required',
        ]);

        if ($validator->fails()) {
            $message = $validator->errors()->first();
            return response()->json(['status' => 'error', 'message' => $message], 400);
        }

        try {
            $bid                       = $bid->find($request->id);
            $bid->proposal_description = $request->proposal;
            $bid->work_due_date        = $request->delivery_date;
            $bid->offer_amount         = $request->offer_amount;
            $bid->update();
            return response()->json(['status' => 'success', 'message' => 'বিড আপডেট সাকসেসফুল!'], 200);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Bid\Bid  $bid
     * @return \Illuminate\Http\Response
     */
    public function deleteImage($data)
    {
        if (file_exists('images/bid/big/' . $data->bid_image) && ($data->bid_image != null)) {
            Storage::disk(currentFileSystem())->delete('bid/big/' . $data->bid_image);
        }

        if (file_exists('images/bid/small/' . $data->bid_image) && ($data->bid_image != null)) {
            Storage::disk(currentFileSystem())->delete('bid/small/' . $data->bid_image);
        }
        return true;
    }

    public function destroy(Bid $bid, $id)
    {
        try {
            DB::beginTransaction();
            $delete = $bid->find($id);
            $demand = Demand::find($delete->demand_id);
            $demand->total_bid -= 1;
            $demand->update();
            $this->deleteImage($delete);

            if ($delete->delete()) {
                DB::commit();
                return response()->json(['status' => 'success', 'message' => 'আপনার বিডটি মুছে ফেলা হয়েছে !']);
            }
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }
}
