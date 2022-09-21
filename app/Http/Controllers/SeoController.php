<?php

namespace App\Http\Controllers;

use App\Http\Resources\SeoResource;
use App\Models\Seo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Image;

class SeoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.settings.seo.seo');
    }

    public function getSeoData()
    {
        $seo = Seo::first();
        return new SeoResource($seo);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return $request->all();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Committee  $committee
     * @return \Illuminate\Http\Response
     */
    public function show(Seo $seo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Committee  $committee
     * @return \Illuminate\Http\Response
     */
    public function edit(Seo $seo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Committee  $committee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Seo $seo)
    {
        // dd($request->all());
        $request->validate([
            'site_name' => 'required',
            'title'     => 'required',
            'author'    => 'required',
        ]);

        try {
            $seo               = $seo->first();
            $seo->title        = $request->title;
            $seo->site_name    = $request->site_name;
            $seo->description  = $request->description;
            $seo->author       = $request->author;
            $seo->description  = $request->description;
            $seo->keyword      = $request->seo_keyword;
            $seo->sitemap_link = $request->sitemap_link;

            $image_extension = 'jpeg';
            $meta_image      = $request->get('new_meta_image');
            if ($meta_image) {
                $fileName = 'meta' . '.' . $image_extension;
                $metaFile = Image::make($meta_image)->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('seo/' . $fileName, $metaFile);

                $seo->meta_image = $fileName;
            }

            $seo->update();
            cache()->forget('org-info');
            return response()->json(['status' => 'success', 'message' => 'Seo Data Updated!']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Committee  $committee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Seo $seo)
    {

    }
}
