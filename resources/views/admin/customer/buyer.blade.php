@extends('admin.master.admin_master')


@section('title','Buyer | Demand Korun')


@section('content')
<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex mt-2">
                      <h4>Buyer List</h4>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3">
                  <div class="col-sm-12 col-12">                        
                          <!-- import components here  -->
                          <view-buyer></view-buyer>
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