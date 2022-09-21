@extends('admin.master.admin_master')


@section('title','Blog | Bangladesh Club Geneva')


@section('content')
<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Blog</h4>
                      <button data-toggle="modal" data-target="#CreateBlog" class="btn btn-outline-primary">Add Blog</button>
                  </div>
              </div>
          </div>
          <div class="widget-content rounded-vertical-pills-icon mt-3">

              <div class="row mb-3">
                  <div class="col-sm-12 col-12">                        
                          <!-- import components here  -->
                          <create-blog :blogtags="{{ $tag }}"></create-blog>
                          <view-blog></view-blog>
                  </div>
              </div>

          </div>
      </div>
  </div>

</div>

@endsection
@push('style')
    <link href="{{ asset('admin-assets/plugins/file-upload/file-upload-with-preview.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('admin-assets/assets/css/users/user-profile.css') }}" rel="stylesheet" type="text/css" />
@endpush

@push('script')
    <script src="{{ url('js/admin.js')}}"></script>
    <script src="{{ asset('admin-assets/plugins/file-upload/file-upload-with-preview.min.js') }}"></script>
    <script>
        //First upload
        var firstUpload = new FileUploadWithPreview('myFirstImage')
        //Second upload
        var secondUpload = new FileUploadWithPreview('mySecondImage')
    </script>
    <!-- END PAGE LEVEL PLUGINS --> 
@endpush