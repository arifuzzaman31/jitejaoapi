@extends('admin.master.admin_master')


@section('title','Payment Setting | JiteJao')


@section('content')
<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Payment Setting</h4>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">
              <div class="row mb-3 mt-3">
                  <div class="col-sm-12 col-12">                        
                      <!-- import components here  -->
                      <payment-setting></payment-setting>
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