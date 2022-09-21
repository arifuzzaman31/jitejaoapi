<?php

namespace App\Http\Controllers;

use App\Models\Sms;
use Illuminate\Http\Request;

class SmsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.settings.sms.sms');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function show(Sms $sms)
    {
        return $sms;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function edit(Sms $sms)
    {
        return $sms;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Sms $sms)
    {
        try {
            // return $request->all();
            $sms->provider_name = $request->provider_name;
            $sms->api_key = $request->api_key;
            $sms->api_secret = $request->api_secret;
            $sms->new_bid_sms = $request->new_bid_sms;
            $sms->confirm_bid_sms = $request->confirm_bid_sms;
            $sms->demand_sms_location_status = $request->demand_sms_location_status;
            $sms->demand_sms_status = $request->demand_sms_status;
            $sms->status = $request->status;
            $sms->update();
            
            return response()->json(['status' => 'success', 'message' => 'SMS Setting Updated!']);
        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sms $sms)
    {
        //
    }
}
