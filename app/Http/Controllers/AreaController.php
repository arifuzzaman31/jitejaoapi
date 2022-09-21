<?php

namespace App\Http\Controllers;

use App\Models\Location\Area;
use App\Repository\Area\AreaRepository;
use Illuminate\Http\Request;
use Throwable;

class AreaController extends Controller
{

    private $AreaRepo;

    public function __construct(AreaRepository $areaRepo)
    {

        $this->AreaRepo = $areaRepo;

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('admin.settings.area.area');
    }

    public function areaList(Request $request)
    {

        $area_list = $this->AreaRepo->getAreaList($request);

        return $area_list;
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
            'name' => 'required',
        ]);

        try
        {
            $area                    = new Area();
            $area->area_name         = $request->name;
            $area->area_english_name = $request->english_name;
            $area->status            = $request->status;
            $area->save();

            return response()->json(['status' => 'success', 'message' => 'New Location Added !']);

        } catch (Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Location\Area  $area
     * @return \Illuminate\Http\Response
     */
    public function show(Area $area)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Location\Area  $area
     * @return \Illuminate\Http\Response
     */
    public function edit(Area $area)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Location\Area  $area
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Area $area)
    {
        $request->validate([
            'name' => 'required',
        ]);

        try
        {
            $area->area_name         = $request->name;
            $area->area_english_name = $request->english_name;
            $area->status            = $request->status;
            $area->update();

            return response()->json(['status' => 'success', 'message' => 'Location Updated !']);

        } catch (Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Location\Area  $area
     * @return \Illuminate\Http\Response
     */
    public function destroy(Area $area)
    {
        //
        try
        {
            $area->delete();
            return response()->json(['status' => 'success', 'message' => 'Area Deleted']);
        } catch (Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }
}
