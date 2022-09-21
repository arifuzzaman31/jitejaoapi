<?php

namespace App\Http\Controllers;

use App\Models\SubscriptionPlan;
use Illuminate\Http\Request;
use Throwable;

class SubscriptionPlanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.settings.payment.subscription_plan');
    }

    public function planList()
    {
        return SubscriptionPlan::orderBy('total_month', 'asc')->get();
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
        $request->validate([
            'plan_name'    => 'required',
            'total_month'  => 'required|integer|gt:0|unique:subscription_plans,total_month',
            'total_amount' => 'required|numeric|gt:0',
            'discount'     => 'required|numeric',
            'final_amount' => 'required|numeric|gt:0',
            'status'       => 'required',
        ]);

        try {
            $plan               = new SubscriptionPlan();
            $plan->plan_name    = $request->plan_name;
            $plan->total_month  = $request->total_month;
            $plan->total_amount = $request->total_amount;
            $plan->discount     = $request->discount;
            $plan->final_amount = $request->final_amount;
            $plan->status       = $request->status;
            $plan->save();
            return response()->json(['status' => 'success', 'message' => 'Plan Created']);

        } catch (Throwable $th) {

            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SubscriptionPlan  $subscriptionPlan
     * @return \Illuminate\Http\Response
     */
    public function show(SubscriptionPlan $subscriptionPlan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SubscriptionPlan  $subscriptionPlan
     * @return \Illuminate\Http\Response
     */
    public function edit(SubscriptionPlan $subscriptionPlan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SubscriptionPlan  $subscriptionPlan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'plan_name'    => 'required',
            'total_month'  => 'required|integer|gt:0|unique:subscription_plans,total_month,' . $id,
            'total_amount' => 'required|numeric|gt:0',
            'discount'     => 'required|numeric',
            'final_amount' => 'required|numeric|gt:0',
            'status'       => 'required',
        ]);

        try {
            $plan               = SubscriptionPlan::find($id);
            $plan->plan_name    = $request->plan_name;
            $plan->total_month  = $request->total_month;
            $plan->total_amount = $request->total_amount;
            $plan->discount     = $request->discount;
            $plan->final_amount = $request->final_amount;
            $plan->status       = $request->status;
            $plan->update();
            return response()->json(['status' => 'success', 'message' => 'Plan Updated']);

        } catch (Throwable $th) {

            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SubscriptionPlan  $subscriptionPlan
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $plan = SubscriptionPlan::find($id);
            $plan->delete();
            return response()->json(['status' => 'success', 'message' => 'Package Deleted']);

        } catch (Throwable $th) {

            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }
}
