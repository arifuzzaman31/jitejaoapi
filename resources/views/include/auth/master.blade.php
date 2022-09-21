<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    @include('include.csrf')
    <title>@yield('title','Login')</title>
    <link rel="icon" type="image/x-icon" href="{{ url('images/favicon.ico') }}"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
    <link href="{{ url('admin-assets/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ url('admin-assets/assets/css/plugins.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ url('admin-assets/assets/css/authentication/form-1.css') }}" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" type="text/css" href="{{ url('admin-assets/assets/css/forms/theme-checkbox-radio.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ url('admin-assets/assets/css/forms/switches.css') }}">

        <!-- sweet alert  -->
        <link href="{{ asset('admin-assets/plugins/sweetalerts/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('admin-assets/plugins/sweetalerts/sweetalert.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('admin-assets/assets/css/components/custom-sweetalert.css') }}" rel="stylesheet" type="text/css" />
    <!-- sweet alert  -->

    @stack('css')
</head>
<body class="form">


   @yield('content')

   <script>
  var base_url  = "{{ url('/') }}"+"/";
 </script>
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="{{ url('admin-assets/assets/js/libs/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ url('admin-assets/bootstrap/js/popper.min.js') }}"></script>
    <script src="{{ url('admin-assets/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="{{ url('admin-assets/assets/js/authentication/form-1.js') }}"></script>


    @stack('script')




</body>
</html>
