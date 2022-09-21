
@extends('include.auth.master')
@section('title','Admin Login | জিতে যাও । JiteJao')
@section('content')

<div class="form-container" id="app">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class=""><a href="http://jitejao.live" target="_blank"><span class="brand-name">JiteJao</span></a> {{ __('Admin Login') }}</h1>
                        <p class="signup-link">@lang('Start Your Session by Login as Admin')</p>
                         <!-- <admin-login></admin-login>       -->
                         @if(Session::has('message'))
                            <div class="alert alert-danger">
                                <h6>{{ Session::get('message') }}</h6>
                            </div>
                        @endif
                         <form class="text-left" action="{{ route('admin.login.post') }}" method="POST">
                            <div class="form">
                            @csrf
                            <div id="username-field" class="field-wrapper input">
                                <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-user"
                                >
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                                <circle cx="12" cy="7" r="4" />
                                </svg>
                                <input
                                id="email"
                                name="email"
                                type="text"
                                class="form-control"
                                placeholder="Email"
                                />
                                @error('email')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>

                            <div id="password-field" class="field-wrapper input mb-2">
                                <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-lock"
                                >
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                </svg>
                                <input
                                id="password"
                                name="password"
                                type="password"
                                class="form-control"
                                placeholder="Password"
                                />
                                @error('password')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="field-wrapper">
                                <button type="submit" class="btn btn-primary">Log In</button>
                            </div>
                            <div class="field-wrapper text-center keep-logged-in">
                                <div class="n-chk new-checkbox checkbox-outline-primary">
                                <label class="new-control new-checkbox checkbox-outline-primary">
                                    <input type="checkbox" name="remember_me" class="new-control-input" />
                                    <span class="new-control-indicator"></span>Keep me logged in
                                </label>
                                </div>
                            </div>

                            <div class="field-wrapper">
                                <a href="{{ url('forgot-password') }}" class="forgot-pass-link">Forgot Password?</a>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-image">
            <div class="l-image">
            </div>
        </div>
    </div>


@endsection
