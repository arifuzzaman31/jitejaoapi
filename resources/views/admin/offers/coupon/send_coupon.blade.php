@extends('admin.master.admin_master')


@section('title','Send Coupon | Demand Korun')


@section('content')
<div class="row mb-4">

  <div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <!-- <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Send Coupon</h4>
                      <button data-toggle="modal" data-target="#CreateUserCoupon" class="btn btn-outline-primary">Add For Coupon</button>
                  </div>
              </div>
          </div> -->
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3 mt-3">
                  <div class="col-sm-12 col-12">
                   <!-- <create-user-coupon :users="{{$user}}" :coupons="{{ $coupon }}" :locations="{{ $location }}"></create-user-coupon> -->
                   <view-user-coupon></view-user-coupon>
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