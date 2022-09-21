@extends('admin.master.admin_master')


@section('title','Contact | Area Setting')


@section('content')

<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Customer Area</h4>
                      <button data-toggle="modal" data-target="#CreateArea" class="btn btn-outline-primary">Create New</button>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3 mt-3">
                  <div class="col-sm-12 col-12">
                   <create-area></create-area>
                   <view-area></view-area>
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
