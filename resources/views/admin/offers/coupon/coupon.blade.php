@extends('admin.master.admin_master')


@section('title','Coupon | Demand Korun')


@section('content')
<div class="row mb-4">

  <div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Coupon</h4>
                      <button data-toggle="modal" data-target="#CreateCoupon" class="btn btn-outline-primary">Create New</button>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3 mt-3">
                  <div class="col-sm-12 col-12">
                   <create-coupon></create-coupon>
                   <view-coupon></view-coupon>
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