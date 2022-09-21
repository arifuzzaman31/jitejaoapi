@extends('admin.master.admin_master')


@section('title','জিতে যাও । FAQ')


@section('content')

<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>FAQ Setting</h4>
                      <a href="{{ route('faq.create') }}" class="btn btn-outline-primary">Create New</a>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3 mt-3">
                  <div class="col-sm-12 col-12">
                     @if(Session::has('success'))
                     <div class="alert alert-success" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><i class="fa fa-close"></i></button>
    <strong>Success!</strong> {{ Session::get('success') }}.</button>
</div>
                     @endif
                     <div class="table-responsive">
                      <table class="table table-condensed">
                       <thead>
                           <tr>
                               <th>Question</th>
                               <th>Answer</th>
                               <!-- <th>Status</th> -->
                               <th>Action</th>
                           </tr>
                       </thead>
                       <tbody>
                       @foreach($faq as $value)

                           <tr>
                               <td>{{ $value->question }}</td>
                               <td style="width: 50%;">{{ $value->answer }}</td>
                               <!-- <td>{{ $value->status == 0 ? 'inactive' : 'active' }}</td> -->
                               <td>
                                 <a href="{{ route('faq.edit',$value->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                 <a onclick="return confirm('are you sure ? ')" href="{{ route('faq.delete',$value->id) }}" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
                               </td>
                           </tr>

                        @endforeach

                       </tbody>
                      </table>
                     </div>
                  </div>
              </div>

          </div>
      </div>
  </div>

</div>

@endsection
