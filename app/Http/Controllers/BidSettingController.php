<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BidSetting;

class BidSettingController extends Controller
{
    public function index()
    {
    	return view('admin.settings.bid.bid');
    }

    public function edit()
    {
    	return BidSetting::first();
    }

    public function update(Request $request)
    {
    	$request->validate([
    		'bid_charge' 	 => 'required|numeric',
    		'min_point_for_bid' => 'required|numeric'
    	]);

    	try {
    		$bid_setting = BidSetting::first();
		    $bid_setting->bid_charge =  $request->bid_charge;
		    $bid_setting->min_point_for_bid = $request->min_point_for_bid;
		    $bid_setting->status = $request->status;
		    $bid_setting->update();

		    return response()->json(['status' => 'success', 'message' => 'Bid Setting Successfully Updated !']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    	
    }
}
