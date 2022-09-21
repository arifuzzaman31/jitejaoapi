<?php

use App\Http\Controllers\Admin\Auth\AdminAuthController;
use App\Http\Controllers\Api\V1\AssetListController;
use App\Http\Controllers\BidController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DemandController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\NilamController;
use App\Http\Controllers\NilamBidController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\PointWithdrawRequestController;
use Illuminate\Support\Facades\Route;

// all admin related route will be here

Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function () {

    Route::resource('admin', AdminAuthController::class);
    Route::get('get-admin', [AdminAuthController::class, 'getAdminData']);
    Route::post('admin-edit/{id}', [AdminAuthController::class, 'update']);
    Route::get('/', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');

    Route::get('dashboard', [DashboardController::class, 'getDashboard']);
    // Role Route
    Route::resource('role', RoleController::class);
    Route::get('get-role', [RoleController::class, 'getRole']);

    //Permission
    Route::post('permission', [RoleController::class, 'Permission']);

    Route::get('logout', [AdminAuthController::class, 'logout'])->name('admin.logout');
    Route::get('change/password', [AdminAuthController::class, 'getChangePasswordPage'])->name('change.password');
    Route::post('change/password', [AdminAuthController::class, 'storeChangePassword'])->name('change.password.post');

    //User
    // Route::get('user/{id}/information', [CustomerController::class, 'getUserInfo']);
    Route::get('user/list', [CustomerController::class, 'getUser']);
    Route::put('user/{id}', [CustomerController::class, 'update']);
    Route::get('user/profile/{id}', [CustomerController::class, 'show']);
    Route::get('user/subscription/date/{id}', [CustomerController::class, 'getSubsDate']);
    Route::post('user/extend/expire/date', [CustomerController::class, 'updateExpireDate']);
    // Add Point from Backend
    Route::post('user/add/point', [CustomerController::class,'addMorePoint']);

    //Demand by Buyer in Buyer List
    Route::get('buyer/{id}/demand', [CustomerController::class, 'getBuyerDemand']);
    Route::get('seller/{id}/bid', [CustomerController::class, 'getSellerBid']);

    //Demand
    Route::get('get-demands', [DemandController::class, 'getDemand'])->name('get-demands');
    Route::get('get-all-demand', [DemandController::class, 'getDemandData']);
    Route::delete('demand/{id}', [DemandController::class, 'destroy']);
    Route::get('demand/{id}', [DemandController::class, 'getDemandById']);
    Route::get('bid/{demand_id}', [BidController::class, 'getBidByDemandId']);
    Route::delete('bid/{id}', [BidController::class, 'destroy']);

    // Plan
    Route::get('subscription-plan-list', [AssetListController::class, 'getPlan']);

    // setting

    Route::resource('nilam', NilamController::class);
    Route::get('expired-nilam', [NilamController::class,'ExpiredNilam'])->name('expired-nilam');
    Route::get('complete-nilam', [NilamController::class,'CompletedNilam'])->name('complete-nilam');
    Route::get('get-nilam', [NilamController::class,'getNilam']);
    Route::get('nilam/bid/{id}', [NilamController::class,'getNilambid']);
    Route::get('nilam/user/bid/{id}', [NilamBidController::class,'getNilamUser']);
    Route::post('nilam/bid/update/{id}/delivery', [NilamController::class,'updateNilamDelivery']);
    Route::get('nilam/delivery/status/{id}', [NilamController::class, 'getDeliveryStatus']);
    Route::post('nilam/bid/update/{id}/seller-status', [NilamController::class,'updateSellerStatus']);
    Route::post('nilam/bid/update/{id}/buyer-status', [NilamController::class,'updateBuyerStatus']);
    Route::post('nilam/bid/update/{id}/delivery-charge', [NilamBidController::class,'updateDeliveryCharge']);
    //Withdraw Request
    Route::get('withdraw-request', [PointWithdrawRequestController::class, 'index'])->name('view-withdraw-request');
    Route::get('get-withdraw-request', [PointWithdrawRequestController::class, 'getRequestData']);
    Route::put('withdraw/update/{id}', [PointWithdrawRequestController::class, 'requestUpdate']);


    Route::resource('faq', FAQController::class);
    Route::get('faq/delete/{id}', [FAQController::class, 'destroy'])->name('faq.delete');
});

Route::get('admin/login', [AdminAuthController::class, 'adminLoginPage'])->name('admin.login');
Route::post('admin/login', [AdminAuthController::class, 'login'])->name('admin.login.post');
