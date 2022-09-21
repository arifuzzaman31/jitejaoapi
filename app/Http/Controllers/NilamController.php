<?php

namespace App\Http\Controllers;

use App\Http\Requests\NilamRequest;
use App\Http\Resources\NilamResource;
use App\Http\Resources\DeliveryHistoryResource;
use App\Models\DeliveryHistory;
use App\Models\Nilam;
use App\Models\NilamBid;
use App\Repository\Nilam\NilamRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Helpers\AllStatic;
use DB,Throwable;

class NilamController extends Controller
{
    private $nilamReposi;
    public function __construct(NilamRepository $nilamRepo)
    {
        $this->nilamReposi = $nilamRepo;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.nilam.nilam');
    }

    public function ExpiredNilam()
    {
        return view('admin.nilam.expirednilam');
    }

    public function CompletedNilam()
    {
        return view('admin.nilam.completenilam');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getNilam(Request $request)
    {
        $per_page = $request->per_page ? $request->per_page : 10;
        $nilam    = Nilam::with('user:id,name');
        // only for short listed
        if ($request->keyword != '') {
            $nilam->where('title', 'LIKE', '%' . $request->keyword . '%');
        }

        if ($request->condition != '') {
            $nilam->where('product_condition', '=', $request->condition);
        }

        if ($request->category == 'pending') {
            $nilam->where('expire_date', '>=', date('Y-m-d H:i:s'))
                ->where('status', '=', AllStatic::$active);
        }

        if ($request->category == 'expired') {
            $nilam->withCount('nilam_bid')->having('nilam_bid_count','>',0)
                ->where('expire_date', '<=', date('Y-m-d H:i:s'));
        }

        if ($request->category == 'complete') {
            $nilam->where('delivery_status', '=', AllStatic::$delivered)
                ->where('expire_date', '<=', date('Y-m-d H:i:s'));
        }

        $nilam = $nilam->orderBy('created_at')->paginate($per_page);
        // return $nilam;
        return NilamResource::collection($nilam);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(NilamRequest $request)
    {
        try {

            $nilam                    = new Nilam();
            $nilam->user_id           = request()->user()->id;
            $nilam->area_id           = request()->user()->area_id;
            $nilam->category_id       = $request->category['id'];
            $nilam->title             = $request->title;
            $nilam->quantity          = $request->quantity;
            $nilam->quantity_unit_id  = $request->quantity_unit;
            $nilam->base_price        = $request->base_price;
            $nilam->expire_date       = $request->expire_date . ' ' . $request->expire_time;
            $nilam->description       = $request->description;
            $nilam->product_condition = $request->product_condition;
            $nilam->video_link        = $request->video_link;
            $nilam->image_one         = $request->image_one_name;
            $nilam->image_two         = $request->image_two_name;
            $nilam->image_three       = $request->image_three_name;
            $nilam->image_four        = $request->image_four_name;

            $nilam->save();

            return response()->json(['status' => 'success', 'message' => 'Nilam Successfully Posted!', 'nilam_id' => $nilam->id], 200);
        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function getDeliveryStatus($id)
    {
        $delivery = DeliveryHistory::with('admin')->where('nilam_id','=',$id)->orderBy('delivery_status','desc')->get();
        return DeliveryHistoryResource::collection($delivery);
    }

    public function updateAddress(Request $request)
    {
        try {
            $nilam                  = Nilam::find($request->id);
            $nilam->delivery_address = $request->address;
            $nilam->update();

            return response()->json(['status' => 'success', 'message' => 'Delivery Address Added!'], 200);

        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function updateExpireTime(Request $request)
    {
        try {
            $nilam                  = Nilam::find($request->id);
            $nilam->expire_date = $request->expire_date . ' ' . $request->expire_time;
            $nilam->update();

            return response()->json(['status' => 'success', 'message' => 'Update Nilam Expire Time!'], 200);

        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function updateNilamDelivery(Request $request, $id)
    {
        $request->validate([
            'delivery_status' => 'required',
            'delivery_date'   => 'required',
        ]);
        // return $id;
        try {
            DB::beginTransaction();
            $nilam                  = Nilam::find($id);
            $nilam->delivery_status = $request->delivery_status;
            $nilam->update();

            $nilam_bid                     = NilamBid::where(['nilam_id' => $id, 'disversed_status' => 0])->first();
            $deli_history                  = new DeliveryHistory();
            $deli_history->nilam_id        = $id;
            $deli_history->bid_id          = $nilam_bid->id;
            $deli_history->admin_id        = \Auth::guard('admin')->user()->id;
            $deli_history->date            = date('Y-m-d H:i:s', strtotime($request->delivery_date));
            $deli_history->delivery_status = $request->delivery_status;
            $deli_history->comment         = $request->comment;
            $deli_history->save();
            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'Delivery Status Changed!', 'nilam_id' => $nilam->id], 200);

        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function updateBuyerStatus(Request $request, $id)
    {
        $request->validate([
            'payment_status' => 'required',
            'payment_date'   => 'required',
        ]);

        try {
            
            $nilam                     = Nilam::find($id);
            $nilam->payment_status     = $request->payment_status;
            $nilam->buyer_payment_date = date('Y-m-d H:i:s', strtotime($request->payment_date));
            $nilam->update();

            $nilam_bid                 = NilamBid::where(['nilam_id' => $id, 'disversed_status' => 0])->first();
            $nilam_bid->payment_status = $request->payment_status;
            $nilam_bid->payment_date   = date('Y-m-d', strtotime($request->payment_date));
            $nilam_bid->note           = $request->note;

            $nilam_bid->update();

            return response()->json(['status' => 'success', 'message' => 'Buyer Status Changed!'], 200);
        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function updateSellerStatus(Request $request, $id)
    {
        $request->validate([
            'payment_status' => 'required',
            'payment_date'   => 'required',
        ]);

        try {
            $nilam                        = Nilam::find($id);
            $nilam->seller_payment_status = $request->payment_status;
            $nilam->seller_payment_date   = date('Y-m-d', strtotime($request->payment_date));
            $nilam->seller_payment_note   = $request->note;

            $nilam->update();

            // $nilam_bid = NilamBid::where(['nilam_id' => $id, 'disversed_status' => 0])->first();
            // $nilam_bid->is_pickup = $request->is_pickup;

            // $nilam_bid->update();

            return response()->json(['status' => 'success', 'message' => 'Seller Status Changed!', 'nilam_id' => $nilam->id], 200);
        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function getNilambid($id)
    {
        return view('admin.nilam.nilam_bid', ['nilam_id' => $id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Nilam  $nilam
     * @return \Illuminate\Http\Response
     */
    public function show(Nilam $nilam)
    {
        // return "jello";
        $nilam_data = $nilam->with('win_bid.bid_user.area', 'user')
            ->where('id', $nilam->id)
            ->first();
        return (new NilamResource($nilam_data));
    }

    public function nilamDetails($id)
    {

        $nilam = Nilam::with(
            ['user:id,area_id,name,avatar,average_buying_rating,buyer_badge,seller_badge,average_saling_rating',
                'category',
                'quantity_unit', 'win_bid.bid_user.area',
            ])->find($id);

        return new NilamResource($nilam);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Nilam  $nilam
     * @return \Illuminate\Http\Response
     */
    public function edit(Nilam $nilam)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Nilam  $nilam
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Nilam $nilam)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Nilam  $nilam
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {

            $nilam = Nilam::find($id);

            if ($nilam->user_id != request()->user()->id) {
                return response()->json(['status' => 'error', 'message' => 'unauthorized'], 400);
            }
            $count = NilamBid::where('nilam_id', '=', $id)->count();
            if ($count > 0) {
                return response()->json(['status' => 'error', 'message' => 'নিলামে বিড রয়েছে ডিলিট করা সম্ভব না'], 400);
            }

            if ($nilam->image_one) {
                Storage::disk(currentFileSystem())->delete('demand/big/' . $nilam->image_one);
                // Storage::disk(currentFileSystem())->delete('demand/medium/' . $nilam->image_one);
                Storage::disk(currentFileSystem())->delete('demand/small/' . $nilam->image_one);
            }
            if ($nilam->image_two) {
                Storage::disk(currentFileSystem())->delete('demand/big/' . $nilam->image_two);
                Storage::disk(currentFileSystem())->delete('demand/small/' . $nilam->image_two);
            }
            if ($nilam->image_three) {
                Storage::disk(currentFileSystem())->delete('demand/big/' . $nilam->image_three);
                Storage::disk(currentFileSystem())->delete('demand/small/' . $nilam->image_three);
            }

            $nilam->delete();

            return response()->json(['status' => 'success', 'message' => 'Nilam Deleted'], 200);

        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => 'Something Went Wrong'], 400);
        }
    }

    public function myNilamList(Request $request)
    {
        $user_id = request()->user()->id;

        $nilams = $this->nilamReposi->userNilam($request, $user_id);

        return NilamResource::collection($nilams);
    }
}
