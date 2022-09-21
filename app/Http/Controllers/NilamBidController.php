<?php

namespace App\Http\Controllers;

use App\Http\Resources\NilamBidResources;
use App\Http\Resources\NilamResource;
use App\Models\Nilam;
use App\Models\NilamBid;
use App\Models\User;
use App\Models\BidSetting;
use Illuminate\Support\Facades\Notification;
use App\Events\Notify;
use App\Notifications\BidOnDemandNotification;
use App\Repository\Nilam\NilamRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NilamBidController extends Controller
{
    public $nilamRepo;
    public function __construct(NilamRepository $nilamRepo)
    {
        $this->nilamRepo = $nilamRepo;
    }

    // get user bid

    public function myBid(Request $request)
    {
        $user_id = request()->user()->id;

        $bids = $this->nilamRepo->userBids($request, $user_id);

        return NilamBidResources::collection($bids);

    }

    public function store(Request $request)
    {
        $request->validate([
            'offer_point' => 'required|integer',
        ]);

        try {
            DB::beginTransaction();

            $bidder          = request()->user();
            $nilam_post_user = Nilam::find($request->nilam_id);

            // if (1000 > $bidder->current_point) {
            //     return response()->json(['status' => 'error', 'message' => 'নিলামে বিড করার জন্যে আপনার অ্যাকাউন্ট এ  সর্বনিম্ন ১০০০ পয়েন্ট থাকতে হবে'], 400);
            // }

            if ($request->nilam_user_id == $bidder->id) {
                return response()->json(['status' => 'error', 'message' => 'আপনি নিজের পোস্ট এ নিজে বিড করতে পারবেন্না'], 400);
            }

            if ($nilam_post_user->base_price > $request->offer_point) {
                return response()->json(['status' => 'error', 'message' => 'আপনার পয়েন্ট বেস প্রাইস থেকে বেশি হতে হবে!'], 400);
            }

            $top_bid = NilamBid::where(['nilam_id' => $request->nilam_id])
                ->max('bid_price');

            $chk_bid = NilamBid::where(['user_id' => $bidder->id, 'nilam_id' => $request->nilam_id, 'bid_price' => $top_bid])
                ->first();

            if ($chk_bid) {
                return response()->json(['status' => 'error', 'message' => 'এখন পর্যন্ত আপনি ই সর্বোচ্চ বিডকারী'], 400);
            }

            if ($top_bid >= $request->offer_point) {
                return response()->json(['status' => 'error', 'message' => 'আপনাকে ' . $top_bid . ' পয়েন্টের উপরে বিড করতে হবে'], 400);
            }

            // $bid_setting = BidSetting::first();
            // $min_amount = ($request->offer_point * $bid_setting->min_point_for_bid) / 100;
            // if ($min_amount > $bidder->current_point) {
            //     return response()->json([
            //         'status'  => 'error',
            //         'message' => 'আপনার বর্তমান পয়েন্ট প্রস্তাবিত পয়েন্টের '.$bid_setting->min_point_for_bid.'% এর কম !',
            //     ], 400);
            // }

            // return response()->json(['status' => 'success', 'message' => 'New Bid done !']);
            $disverse = NilamBid::where(['nilam_id' => $request->nilam_id])
                ->latest()->first();
            if ($disverse) {
                $disverse->disversed_status = 1;
                $disverse->update();

                // $point_back = User::find($disverse->user_id);
                // $point_back->current_point += $disverse->bid_price;
                // $point_back->update();
            }

            // delete user previous bid in this nilam

            //Broadcast
            // broadcast(new Notify($bid));
                    // broadcast(new Notify($bid))->toOthers();
            // $bidder_picture = $bidder->avatar ?? 'default/avatar.svg';
            // $details = [
            //     'post_url' => '/nilam/' . $request->nilam_id .'/'.uniqueString(),
            //     'apps_url' => '/nilam/' . $request->nilam_id .'/'.uniqueString(),
            //     'type'  => 'nilam',
            //     'notification_message'  => 'You Have Bid On Your Nilam',
            //     'bidder_id' => $bidder->id,
            //     'bidder_name' => $bidder->name,
            //     'bidder_avatar' => fileBaseUrl() .'/avatar/'. $bidder_picture,
            //     'bidder_phone' => $bidder->mobile_no
            // ];
            //nofify the athor of demand
            //Notification::send($nilam_post_user->user, new BidOnDemandNotification($details));
            // $demand->user->notify(new BidOnDemandNotification($details));


            NilamBid::where(['user_id' => $bidder->id, 'nilam_id' => $request->nilam_id])->update(['user_bid_status' => 0]);

            $bid                   = new NilamBid();
            $bid->nilam_id         = $request->nilam_id;
            $bid->nilam_user_id    = $nilam_post_user->user_id;
            $bid->user_id          = $bidder->id;
            $bid->bid_price        = $request->offer_point;
            $bid->proposal         = $request->proposal;
            $bid->status           = 1;
            $bid->user_bid_status  = 1;
            $bid->disversed_status = 0;
            $bid->save();

            $bidder->current_point -= $bid->bid_price;
            $bidder->update();

            DB::commit();

            $user_bid = NilamBid::with(['bid_user.area'])->find($bid->id);

            return response()->json(['status' => 'success', 'message' => 'Bid Successfully done !', 'bid' => new NilamBidResources($user_bid)]);

        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => 'Something went wrong! Try Again.']);
        }
    }

    public function updateDeliveryCharge(Request $request,$id)
    {
        // return $request->all();
        try {
            $bid = NilamBid::find($id);
            $bid->delivery_charge = $request->delivery_charge_amount;
            $bid->update();
            return response()->json(['status' => 'success', 'message' => 'Delivery Charge Successfully Added !'],200);
            
        } catch (Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()],400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NilamBid  $nilamBid
     * @return \Illuminate\Http\Response
     */
    public function show(NilamBid $nilamBid)
    {
        return "hellp";
        // return \DB::table('nilam_bids')
        //     ->join('nilams', 'nilam_bids.nilam_id', '=', 'nilams.id')
        //     ->join('users', 'nilam_bids.user_id', '=', 'users.id')
        //     ->select('nilam_bids.*', 'nilams.*', 'users.*')
        //     ->orderBy('bid_price')
        //     ->get();
        // return NilamBid::orderBy('bid_price','desc')->groupBy('nilam_user_id')->get();
    }

    public function getNilamUser(NilamBid $nilamBid, $id)
    {
        // 'bid_user.area','win_bid'
        $nilam_user = $nilamBid->with(['bid_user.area'])->where('nilam_id', '=', $id)->latest()->paginate(6);
        return NilamBidResources::collection($nilam_user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NilamBid  $nilamBid
     * @return \Illuminate\Http\Response
     */
    public function edit(NilamBid $nilamBid)
    {
        //
    }

    public function nilamDetails($id)
    {
        $nilam = Nilam::with(
            ['user:id,area_id,name,avatar',
                'category',
                'quantity_unit',
            ])->find($id);

        return new NilamResource($nilam);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NilamBid  $nilamBid
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NilamBid $nilamBid)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NilamBid  $nilamBid
     * @return \Illuminate\Http\Response
     */
    public function destroy(NilamBid $nilamBid)
    {
        //
    }
}
