@extends('admin.master.admin_master')


@section('title','জিতে যাও । FAQ')


@section('content')

<div class="row mb-4">

<div  class="col-lg-12 col-12">
      <div class="statbox widget box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12 heading_flex">
                      <h4>Update FAQ</h4>
                      <a href="{{ route('faq.index') }}" class="btn btn-outline-primary">View All</a>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area rounded-vertical-pills-icon">

              <div class="row mb-3 mt-3">
                  <div class="col-sm-8 mr-auto ml-auto">
                  <form action="{{ route('faq.update',$faq->id) }}" method="POST">
                  @csrf
                  @method('PUT')
                  <div class="form-group">
                    <label for="">Enter Question</label>
                    <input type="text" class="form-control"  value="{{ $faq->question }}"  name="question" required>
                    </div>
                    <div class="form-group">
                    <label for="">Enter Answer</label>
                    <textarea name="answer" class="form-control"  id="" required>{{ $faq->answer }}</textarea>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-success">Update</button>
                    </div>
                  </form>
                  </div>
              </div>

          </div>
      </div>
  </div>

</div>

@endsection
