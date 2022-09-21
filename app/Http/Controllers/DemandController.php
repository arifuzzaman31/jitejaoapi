<?php

namespace App\Http\Controllers;

use App\Helpers\AllStatic;
use App\Http\Requests\Demand\DemandRequest;
use App\Http\Resources\DemandResource;
use App\Models\Category\Category;
use App\Models\Demand\Demand;
use App\Models\Sendsms;
use App\Models\Sms;
use App\Models\User\UserInformation;
use App\Repository\Demand\DemandRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Throwable;

class DemandController extends Controller
{
    private $demandRepo;
    public function __construct(DemandRepository $demandRepo)
    {
        $this->demandRepo = $demandRepo;
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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $request->validate([
            'title'         => 'required',
            'category'      => 'required',
            'quantity'      => 'required',
            'quantity_unit' => 'required',
            'expire_date'   => 'required',
        ]);

        try {
            $demand                   = Demand::find($request->id);
            $demand->title            = $request->title;
            $demand->category_id      = $request->category['id'];
            $demand->area_id          = request()->user()->area_id;
            $demand->user_id          = request()->user()->id;
            $demand->quantity         = $request->quantity;
            $demand->quantity_unit_id = $request->quantity_unit;
            $demand->description      = $request->description;
            $demand->budget_type      = $request->budget_type == true ? 1 : 0;
            $demand->minimum_budget   = $request->minimum_budget;
            $demand->maximum_budget   = $request->maximum_budget;
            $demand->expire_date      = $request->expire_date;

            // image one
            $image_extension = 'jpeg';
            $image_one       = $request->get('new_image_one');
            $image_two       = $request->get('new_image_two');
            $image_three     = $request->get('new_image_three');

            $big_image_height   = 470;
            $mid_image_height   = 170;
            $small_image_height = 70;

            if ($image_one) {
                if (file_exists('images/demand/big/' . $demand->image_one) && ($demand->image_one != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/big/' . $demand->image_one);
                }

                if (file_exists('images/demand/medium/' . $demand->image_one) && ($demand->image_one != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/medium/' . $demand->image_one);

                }

                if (file_exists('images/demand/small/' . $demand->image_one) && ($demand->image_one != null)) {

                    Storage::disk(currentFileSystem())->delete('demand/small/' . $demand->image_one);
                }

                $imageOneName        = request()->user()->id . '_one_' . uniqid() . '.' . $image_extension;
                $image_one_main_file = Image::make($image_one)->resize(null, $big_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 70);
                $image_one_medium_file = Image::make($image_one)->resize(null, $mid_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 90);
                $image_one_small_file = Image::make($image_one)->resize(null, $small_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('demand/big/' . $imageOneName, $image_one_main_file);
                // Storage::disk(currentFileSystem())->put('demand/medium/' . $imageOneName, $image_one_medium_file);
                Storage::disk(currentFileSystem())->put('demand/small/' . $imageOneName, $image_one_small_file);

                $demand->image_one = $imageOneName;

            }
            if ($image_two) {
                if (file_exists('images/demand/big/' . $demand->image_two) && ($demand->image_two != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/big/' . $demand->image_two);
                }

                if (file_exists('images/demand/medium/' . $demand->image_two) && ($demand->image_two != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/medium/' . $demand->image_two);

                }

                if (file_exists('images/demand/small/' . $demand->image_two) && ($demand->image_two != null)) {

                    Storage::disk(currentFileSystem())->delete('demand/small/' . $demand->image_two);
                }

                $imageTwoName        = request()->user()->id . '_two_' . uniqid() . '.' . $image_extension;
                $image_two_main_file = Image::make($image_two)->resize(null, $big_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 70);
                $image_two_small_file = Image::make($image_two)->resize(null, $small_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('demand/big/' . $imageTwoName, $image_two_main_file);
                Storage::disk(currentFileSystem())->put('demand/small/' . $imageTwoName, $image_two_small_file);

                $demand->image_two = $imageTwoName;

            }

            if ($image_three) {
                if (file_exists('images/demand/big/' . $demand->image_three) && ($demand->image_three != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/big/' . $demand->image_three);
                }

                if (file_exists('images/demand/medium/' . $demand->image_three) && ($demand->image_three != null)) {
                    Storage::disk(currentFileSystem())->delete('demand/medium/' . $demand->image_three);

                }

                if (file_exists('images/demand/small/' . $demand->image_three) && ($demand->image_three != null)) {

                    Storage::disk(currentFileSystem())->delete('demand/small/' . $demand->image_three);
                }

                $imageThreeName        = request()->user()->id . '_three_' . uniqid() . '.' . $image_extension;
                $image_three_main_file = Image::make($image_three)->resize(null, $big_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 70);
                $image_three_small_file = Image::make($image_three)->resize(null, $small_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('demand/big/' . $imageThreeName, $image_three_main_file);
                Storage::disk(currentFileSystem())->put('demand/small/' . $imageThreeName, $image_three_small_file);

                $demand->image_three = $imageThreeName;

            }

            if($request->from_app === true)
            {
                if($request->image_one_name != '' || $request->image_one_name != NULL)
                {
                    if (file_exists('images/demand/big/' . $demand->image_one) && ($demand->image_one != null)) {
                        Storage::disk(currentFileSystem())->delete('demand/big/' . $demand->image_one);
                    }

                    $demand->image_one = $request->image_one_name;
                }
                
                if($request->image_two_name != '' || $request->image_two_name != NULL)
                {
                    if (file_exists('images/demand/medium/' . $demand->image_two) && ($demand->image_two != null)) {
                        Storage::disk(currentFileSystem())->delete('demand/medium/' . $demand->image_two);
                    }
                    $demand->image_two = $request->image_two_name;
                }
                
                if($request->image_three_name != '' || $request->image_three_name != NULL)
                {
                    if (file_exists('images/demand/small/' . $demand->image_three) && ($demand->image_three != null)) {

                        Storage::disk(currentFileSystem())->delete('demand/small/' . $demand->image_three);
                    }
                    $demand->image_three = $request->image_three_name;
                }
            }
            $demand->update();
            return response()->json(['status' => 'success', 'message' => 'Demand Updated', 'demand_id' => $demand->id], 200);
        } catch (\Throwable $e) {
            if($request->get('new_image_one') || $request->get('new_image_two') || $request->get('new_image_three')){
                $this->deleteDemandImage($demand);
            }
            return response()->json(['status' => 'error', 'message' => 'something went wrong!'], 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(DemandRequest $request)
    {

        try
        {
            DB::beginTransaction();

            $demand                   = new Demand;
            $demand->title            = $request->title;
            $demand->category_id      = $request->category['id'];
            $demand->area_id          = request()->user()->area_id;
            $demand->user_id          = request()->user()->id;
            $demand->quantity         = $request->quantity;
            $demand->quantity_unit_id = $request->quantity_unit;
            $demand->description      = $request->description;
            $demand->budget_type      = $request->budget_type == true ? 1 : 0;
            $demand->minimum_budget   = $request->minimum_budget;
            $demand->maximum_budget   = $request->maximum_budget;
            $demand->expire_date      = $request->expire_date;
            $demand->image_one        = $request->image_one_name;
            $demand->image_two        = $request->image_two_name;
            $demand->image_three      = $request->image_three_name;
            $demand->save();

            // update user information table by new post

            $user = UserInformation::where('user_id', request()->user()->id)->first();
            if ($user) {
                $user->total_post += 1;
                $user->save();
            }

            $sms_setting = new Sms();
            if (($sms_setting->status == 1) && ($sms_setting->demand_sms_status == 1)) {
                //store demand id for sending sms to user as per category wise
                $sms            = new Sendsms();
                $sms->demand_id = $demand->id;
                $sms->save();
            }

            // update category

            $category = Category::find($request->category['id']);
            $category->total_demand += 1;
            $category->save();

            DB::commit();

            return response()->json(['status' => 'success', 'message' => 'ডিমান্ড সাকসেসফুল', 'demand_id' => $demand->id], 200);

        } catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    // upload all image by this function

    public function uploadImage(Request $request)
    {
        // return $request->all();
        $request->validate([
            'image' => 'required|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
        ]);

        try
        {
            // image one
            $image_extension = 'jpeg';
            $imageFile       = $request->get('image');

            $big_image_height   = 470;
            $small_image_height = 70;

            if ($imageFile) {

                $imageName       = request()->user()->id . '_demand_' . uniqid() . '.' . $image_extension;
                $image_main_file = Image::make($imageFile)->resize(null, $big_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 70);

                $image_small_file = Image::make($imageFile)->resize(null, $small_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('demand/big/' . $imageName, $image_main_file);
                Storage::disk(currentFileSystem())->put('demand/small/' . $imageName, $image_small_file);

                return response()->json([
                    'status'    => 'success',
                    'message'   => 'Demand Created',
                    'image_url' => fileBaseUrl() . '/demand/small/' . $imageName,
                    'image'     => $imageName,
                    'type'      => $request->image_type], 200);

            }

        } catch (Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function uploadAppImage(Request $request)
    {
    
        $request->validate([
            'image' => 'required|mimes:jpeg,png,PNG,gif,jpg,webp,bmp',
        ],[
           'image.required' => 'image required'
        ]);

        try
        {
            $image_extension = 'jpeg';
            $imageFile       = $request->file('image');

            $big_image_height   = 470;
            $small_image_height = 70;

            if ($imageFile) {

                $imageName       = request()->user()->id . '_demand_' . uniqid() . '.' . $image_extension;
                $image_main_file = Image::make($imageFile)->resize(null, $big_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 70);
                $image_small_file = Image::make($imageFile)->resize(null, $small_image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('demand/big/' . $imageName, $image_main_file);
                Storage::disk(currentFileSystem())->put('demand/small/' . $imageName, $image_small_file);

                return response()->json([
                    'status'    => 'success',
                    'message'   => 'Demand Created',
                    'image_url' => fileBaseUrl() . '/demand/small/' . $imageName,
                    'image'     => $imageName,
                    'type'      => $request->image_type], 200);

            }

        } catch (Throwable $e) {
            // return response()->json($e);
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Demand\Demand  $demand
     * @return \Illuminate\Http\Response
     */
    public function edit(Demand $demand, $id)
    {
        try {
            $demand = $demand->with('category', 'quantity_unit')->find($id);
            if ($demand->total_bid > 0) {
                return response()->json(['status' => 'error', 'message' => 'Already Having Bid, You can`t update!']);
            }
            return new DemandResource($demand);

        } catch (Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    // single demand details

    public function demandDetails($id)
    {
        // return fileBaseUrl();
        $demand = Demand::with(
            ['user:id,area_id,name,avatar,average_buying_rating,buyer_badge',
                'area',
                'category',
                'quantity_unit',
            ])->find($id);

        return new DemandResource($demand);
    }

    public function myDemandList(Request $request)
    {
        $user_id = request()->user()->id;

        $demands = $this->demandRepo->userDemands($request, $user_id);

        return DemandResource::collection($demands);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Demand\Demand  $demand
     * @return \Illuminate\Http\Response
     */
    public function deleteDemandImage($data)
    {
        if (file_exists('images/demand/big/' . $data->image_one) && ($data->image_one != null)) {
            Storage::disk(currentFileSystem())->delete('demand/big/' . $data->image_one);
            // Storage::disk(currentFileSystem())->delete('demand/medium/' . $data->image_one);
            Storage::disk(currentFileSystem())->delete('demand/small/' . $data->image_one);
        }
        if (file_exists('images/demand/big/' . $data->image_two) && ($data->image_two != null)) {
            Storage::disk(currentFileSystem())->delete('demand/big/' . $data->image_two);
            Storage::disk(currentFileSystem())->delete('demand/small/' . $data->image_two);
        }
        if (file_exists('images/demand/big/' . $data->image_three) && ($data->image_three != null)) {
            Storage::disk(currentFileSystem())->delete('demand/big/' . $data->image_three);
            Storage::disk(currentFileSystem())->delete('demand/small/' . $data->image_three);
        }
        return true;
    }

    public function destroy(Demand $demand, $id)
    {
        try {
            $demand_data = $demand->findOrFail($id);
            if (($demand_data->total_bid > 0) || (date('Y-m-d') > $demand_data->expire_date)) {
                return response()->json(['status' => 'error', 'message' => 'দুঃখিত! এই ডিমান্ডে বিড রয়েছে।'], 400);
            }
            $this->deleteDemandImage($demand_data);

            $demand_data->delete();
            return response()->json(['status' => 'success', 'message' => 'Demand Deleted'], 200);

        } catch (Throwable $e) {

            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function getDemand(Demand $demand)
    {
        return view('admin.demand.demand');
    }

    public function getDemandById(Demand $demand, $id)
    {
        $demand = $demand->with(['user:id,name', 'category:id,name', 'area:id,area_name', 'quantity_unit:id,name'])->findOrFail($id);
        return new DemandResource($demand);
    }

    public function getDemandData(Request $request)
    {
        $demand = Demand::with(['user:id,name', 'category:id,name,english_name', 'quantity_unit:id,english_name,name'])->orderBy('created_at', 'desc');
        if ($request->keyword != '') {
            $demand = $demand->where('title', 'LIKE', '%' . $request->keyword . '%');
            $demand = $demand->orWhere('expire_date', 'LIKE', '%' . $request->keyword . '%');
        }
        $demand = $demand->paginate(12);
        return $demand;

    }

    public function smsTest(Request $request)
    {
        $sms_setting = Sms::first();
        if ($sms_setting->status == 1) {

            $jobs = Sendsms::where('status', AllStatic::$inactive)->get();
            // dd($jobs);
            foreach ($jobs as $job) {
                if ($job) {
                    $demand = Demand::with('category.user')
                        ->where('id', $job->demand_id)
                        ->where('bid_status', AllStatic::$not_confirm)
                        ->where('expire_date', '>', date('Y-m-d'))
                        ->where('sms_status', AllStatic::$inactive)
                        ->first();
                    // return $demand; 1002, 5, 8,9, 10,15, 17
                    if ($demand) {

                        $demand_number = $demand->category->user;
                        if ($sms_setting->demand_sms_location_status == 1) {
                            $demand_number = collect($demand_number)->where('area_id', '=', $demand->area_id);
                        }
                        $demand_number = $demand_number->pluck('mobile_no')->toArray();
                        $message       = "আপনার ক্যাটাগরিতে একটি ডিমান্ড পড়েছে! ভিজিট করুনঃ " . env('FRONT_URL') . '/demand/' . $demand->id . '/' . uniqueString();

                        if (count($demand_number) > 0) {
                            $numbers = array_slice($demand_number, 0, 100);
                            foreach ($numbers as $value) {
                                // sending sms using adn sms api
                                AdnSms::sendSingleSms($value, $message, 'TEXT');
                            }
                        }

                        $demand->sms_status = AllStatic::$active;
                        $demand->update();

                    }

                    $job->delete();
                }
            }
        }

    }
}
