@extends('admin.master.admin_master')


@section('title','Demand Korun |  Category & Unit Settings')

@push('style')

<link href="{{ asset('admin-assets/assets/css/components/tabs-accordian/custom-tabs.css') }}" rel="stylesheet" type="text/css" />

@endpush

@section('content')

<div class="row mb-4">

<div id="tabsVerticalWithIcon" class="col-lg-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                            <h4>Category & QTY Unit Setting</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area rounded-vertical-pills-icon">

                                    <div class="row mb-3 mt-3">
                                        <div class="col-sm-3 col-12">
                                            <div class="nav flex-column nav-pills mb-sm-0 mb-3" id="rounded-vertical-pills-tab" role="tablist" aria-orientation="vertical">
                                              <a class="nav-link mb-2 active mx-auto" id="rounded-vertical-pills-home-tab" data-toggle="pill" href="#rounded-vertical-pills-home"
                                               role="tab" aria-controls="rounded-vertical-pills-home" aria-selected="true">
                                               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-command"><path d="M18 3a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3H6a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3V6a3 3 0 0 0-3-3 3 3 0 0 0-3 3 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 3 3 0 0 0-3-3z"></path></svg> Category</a>
                                              <a class="nav-link mb-2 mx-auto" id="rounded-vertical-pills-messages-tab" data-toggle="pill" href="#rounded-vertical-pills-messages"
                                               role="tab" aria-controls="rounded-vertical-pills-messages" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-git-pull-request"><circle cx="18" cy="18" r="3"></circle><circle
                                               cx="6" cy="6" r="3"></circle><path d="M13 6h3a2 2 0 0 1 2 2v7"></path><line x1="6" y1="9" x2="6" y2="21"></line></svg> Quantity Unit</a>
                                            </div>
                                        </div>

                                        <div class="col-sm-9 col-12">

                                           <!-- Category Tab  -->
                                            <div class="tab-content" id="rounded-vertical-pills-tabContent">
                                              <div class="tab-pane fade show active" id="rounded-vertical-pills-home" role="tabpanel"
                                              aria-labelledby="rounded-vertical-pills-home-tab">

                                              <div class="mb-2" style="display: flex;justify-content: space-between;">
                                                  <h4 class="mb-4">Manage Category</h4>
                                                  <button data-toggle="modal" data-target="#CreateCategory" class="btn btn-outline-primary">Create New</button>
                                              </div>

                                                <!-- import components here  -->
                                                <create-category></create-category>
                                                <view-category></view-category>

                                            </div>

                                            <!-- Quantity Unit Tab -->

                                            <div class="tab-pane fade" id="rounded-vertical-pills-messages" role="tabpanel" aria-labelledby="rounded-vertical-pills-messages-tab">
                                                    <div class="mb-2" style="display: flex;justify-content: space-between;">
                                                        <h4 class="mb-4">Manage Unit</h4>
                                                        <button data-toggle="modal" data-target="#CreateUnit" class="btn btn-outline-primary">Create New</button>
                                                    </div>
                                                    <create-unit></create-unit>
                                                    <view-unit></view-unit>
                                               </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

</div>

@endsection

@push('script')
    <script src="{{ url('js/settings.js')}}"></script>
@endpush
