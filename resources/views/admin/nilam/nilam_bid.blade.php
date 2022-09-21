@extends('admin.master.admin_master')
@section('title','নিলাম | জিতে যাও')
@section('content')
<div class="row mb-4">
  <div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">
            <!-- {{ $nilam_id }} -->
              <div class="row mb-3">
                  <div class="col-sm-12 col-12">                        
                          <!-- import components here  -->
                          <nilam-bid :nilam_id="{{ $nilam_id }}"></nilam-bid>
                  </div>
              </div>

          </div>
      </div>
  </div>

</div>

@endsection

@push('script')
<link href="{{ url('admin-assets/assets/css/dashboard/dash_1.css')}}" rel="stylesheet" type="text/css" />
  <!-- <link href="{{ url('admin-assets/assets/css/dashboard/dash_2.css')}}" rel="stylesheet" type="text/css" /> -->
  <link href="{{ url('admin-assets/assets/css/users/user-profile.css')}}" rel="stylesheet" type="text/css" />
  <link href="{{ url('admin-assets/assets/css/components/timeline/custom-timeline.css')}}" rel="stylesheet" type="text/css" />
    <script src="{{ url('js/admin.js')}}"></script>
@endpush