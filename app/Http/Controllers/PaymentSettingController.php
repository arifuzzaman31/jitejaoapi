<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PaymentSetting;

class PaymentSettingController extends Controller
{
    public function index()
    {
    	return view('admin.settings.payment.payment');
    }

    public function edit()
    {
    	return PaymentSetting::first();
    }

    public function update(Request $request)
    {
    	$request->validate([
    		'monthly_charge' 	 => 'required|numeric',
    		'discount_for_month' => 'required|numeric',
    		'discount_type' 	 => 'required|numeric',
    		'discount_amount' 	 => 'required|numeric',
    		'max_discount_amount' => 'required|numeric',
    		'discount_status' 	 => 'required|numeric'
    	]);

    	try {
    		$payment = PaymentSetting::first();
		    $payment->monthly_charge =  $request->monthly_charge;
		    $payment->discount_for_month = $request->discount_for_month;
		    $payment->discount_type = $request->discount_type;
		    $payment->discount_amount = $request->discount_amount;
		    $payment->max_discount_amount = $request->max_discount_amount;
		    $payment->discount_status = $request->discount_status;
		    $payment->status = $request->status;
		    $payment->update();

		    return response()->json(['status' => 'success', 'message' => 'Payment Setting Successfully Updated !']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    	
    }
}
