@extends('admin.master.admin_master')


@section('title','জিতে যাও | Admin Dashboard')


@section('content')
<div class="row layout-top-spacing">
    <dashboard></dashboard>
</div>
@endsection

@push('script')
    <script src="{{ url('js/admin.js')}}"></script>
@endpush
@push('style')
    <link href="{{ asset('admin-assets/assets/css/dashboard/dash_2.css') }}" rel="stylesheet" type="text/css" />
@endpush