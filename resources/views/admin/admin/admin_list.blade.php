@extends('admin.master.admin_master')


@section('title','Admin List | Bangladesh Club Geneva')


@section('content')
<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Admin</h4>
                      <button data-toggle="modal" data-target="#CreateAdmin" class="btn btn-outline-primary">Add Admin</button>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3">
                  <div class="col-sm-12 col-12">                        
                          <!-- import components here  -->
                          <create-admin></create-admin>
                          <view-admin></view-admin>
                  </div>
              </div>

          </div>
      </div>
  </div>

</div>

@endsection

@push('script')
    <script src="{{ url('js/admin.js')}}"></script>
@endpush