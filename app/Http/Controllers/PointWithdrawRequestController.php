<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PointWithdrawRequest;
use App\Models\User;
use App\Helpers\AllStatic;
use Throwable,DB;

class PointWithdrawRequestController extends Controller
{
    public function index()
    {
        return view('admin.withdraw.withdrawrequest');
    }

    public function withdrawRequest(Request $request)
    {
    	// return $request->all();
    	$request->validate([
    		'amount' => 'required',
    		'note' => 'required'
    	]);
    		
    	try {
            DB::beginTransaction();
            $userid = request()->user()->id;
            $withdraw                 	= new PointWithdrawRequest();
            $withdraw->user_id          = $userid;
            $withdraw->request_amount   = $request->amount;
            $withdraw->request_date     = date('Y-m-d H:i:s');
            $withdraw->note       		= $request->note;
            $withdraw->status       	= 0;
            $withdraw->save();

            $user = User::find($userid);
            $user->current_point = $user->current_point - $request->amount;
            $user->update();

            DB::commit();

            return response()->json(['status' => 'success', 'message' => 'Withdraw request Successfully done!'], 200);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    public function getRequestData(Request $request)
    {
        $per_page     = 10;
        if ($request->per_page) {
            $per_page = $request->per_page;
        }
        $withdraw = PointWithdrawRequest::with('user','admin')->orderBy('id', 'desc');

        if ($request->keyword != '') {
            $withdraw->where('note', 'LIKE', '%' . $request->keyword . '%');
        }
        if ($request->no_paginate) {
            if ($request->take_only) {
                $withdraw->take($request->take_only);
            }
            $withdraw = $withdraw->get();
        } else {
            $withdraw = $withdraw->paginate($per_page);
        }
        return $withdraw;
    }

    public function requestUpdate(Request $request,$id)
    {
        $request->validate([
            'payment_date' => 'required',
            'payment_method' => 'required',
            'status' => 'required'
        ]);
            
        try {
            
            $withdraw                   = PointWithdrawRequest::find($id);
            $withdraw->payment_method   = $request->payment_method;
            $withdraw->return_date      = $request->payment_date;
            $withdraw->admin_id         = \Auth::guard('admin')->user()->id;
            $withdraw->status           = $request->status;
            $withdraw->update();

            return response()->json(['status' => 'success', 'message' => 'Withdraw Successfully Updated!'], 200);
        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }
}
