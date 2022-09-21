@extends('include.auth.master')
@section('title','Change Password | জিতে যাও । JiteJao')
@section('content')

<div class="form-container" id="app">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">
                        <h3 class=""> {{ __('Update Admin Password') }}</h3>
                        <p class="signup-link">@lang('Here you can change your password.')</p>
                         <form class="text-left" action="{{ route('change.password.post') }}" method="POST">
                            <div class="form">
                            @csrf

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
                                class="feather feather-unlock"
                                >
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                </svg>
                                <input
                                class="form-control @error('password') is-invalid @enderror"
                                id="password" type="password" 
                                name="oldpassword" required 
                                placeholder="Old Password"
                                />
                                
                                @if(Session::has('error'))
                                    <span class="invalid-feedback">
                                        <p>{{ Session::get('error') }}</p>
                                    </span>
                                @endif
                            </div>
                            <div id="password-field-new" class="field-wrapper input mb-2">
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
                                class="form-control @error('password') is-invalid @enderror"
                                id="password" type="password" 
                                name="password" required 
                                placeholder="New Password"
                                autocomplete="new-password"
                                />
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div id="password-field-confirm" class="field-wrapper input mb-2">
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
                                name="password_confirmation"
                                type="password"
                                class="form-control"
                                placeholder="Confirm Password"
                                autocomplete="new-password"
                                />
                            </div>
                            <div class="field-wrapper">
                                <button type="submit" class="btn btn-primary">Update</button>
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