<?php

namespace App\Http\Controllers;

use App\Models\Setting\QuantityUnit;
use Illuminate\Http\Request;
use Throwable;

class QuantityUnitController extends Controller
{
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
    public function create()
    {
        //
    }

    public function unitList(Request $request)
    {
        $per_page = 10;
        $keyword  = $request->keyword;
        if ($request->has('per_page')) {
            $per_page = $request->per_page;
        }

        $unit = QuantityUnit::orderBy('name', 'asc');
        if ($keyword != '') {
            $unit->where(function ($query) use ($keyword) {
                $query->where('name', 'LIKE', '%' . $keyword . '%')
                    ->where('english_name', 'LIKE', '%' . $keyword . '%');
            });
        }

        if ($request->status) {
            $unit->where('status', '=', $request->status);
        }

        // for all unit
        if ($request->has('no_pagination')) {
            $unit = $unit->get();
        } else {
            $unit = $unit->paginate($per_page);
        }

        return $unit;
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
            'name' => 'required',
        ]);

        try {
            $unit               = new QuantityUnit;
            $unit->name         = $request->name;
            $unit->english_name = $request->english_name;
            $unit->status       = $request->status;
            $unit->save();
            return response()->json(['status' => 'success', 'message' => 'Quantity Unit Created Successfully!']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Company\Product\Setting\QuantityUnit  $quantityUnit
     * @return \Illuminate\Http\Response
     */
    public function show(QuantityUnit $quantityUnit)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Company\Product\Setting\QuantityUnit  $quantityUnit
     * @return \Illuminate\Http\Response
     */
    public function edit(QuantityUnit $quantityUnit)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Company\Product\Setting\QuantityUnit  $quantityUnit
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, QuantityUnit $quantityUnit)
    {
        $request->validate([
            'name' => 'required',
        ]);

        try {
            $quantityUnit->findOrFail($request->id);
            $quantityUnit->name         = $request->name;
            $quantityUnit->english_name = $request->english_name;
            $quantityUnit->status       = $request->status;

            $quantityUnit->update();
            return response()->json(['status' => 'success', 'message' => 'Qty Unit Updated Successfully!']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Company\Product\Setting\QuantityUnit  $quantityUnit
     * @return \Illuminate\Http\Response
     */
    public function destroy(QuantityUnit $quantityUnit)
    {
        try {
            $quantityUnit->findOrFail($quantityUnit->id)->delete();
            return response()->json(['status' => 'success', 'message' => 'Unit Deleted !'], 200);
        } catch (Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }

    }
}
