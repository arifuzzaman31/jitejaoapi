<?php

namespace App\Http\Controllers;

use App\Models\FAQ;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Throwable;

class FAQController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $faq = FAQ::orderBy('id', 'desc')->get();
        return view('admin.settings.faq.faq', ['faq' => $faq]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //

        return view('admin.settings.faq.create_faq');
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
        $request->validate([
            'question' => 'required',
            'answer'   => 'required',
        ]);

        try {
            $faq           = new FAQ();
            $faq->question = $request->question;
            $faq->answer   = $request->answer;
            $faq->save();
            Session::flash('success', 'FAQ added');
            return redirect()->route('faq.index');
        } catch (Throwable $th) {
            return $th;
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FAQ  $fAQ
     * @return \Illuminate\Http\Response
     */
    public function show(FAQ $fAQ)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FAQ  $fAQ
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

        $faq = FAQ::find($id);

        return view('admin.settings.faq.edit_faq', ['faq' => $faq]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FAQ  $fAQ
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'question' => 'required',
            'answer'   => 'required',
        ]);

        $faq           = FAQ::find($id);
        $faq->question = $request->question;
        $faq->answer   = $request->answer;
        $faq->save();
        Session::flash('success', 'FAQ Updated');
        return redirect()->route('faq.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FAQ  $fAQ
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $faq = FAQ::find($id);
        $faq->delete();

        Session::flash('success', 'FAQ Deleted');
        return redirect()->back();

    }
}
