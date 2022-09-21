<?php

use App\Http\Controllers\Api\V1\AssetListController;
use App\Http\Controllers\Api\V1\Auth\LoginController;
use App\Http\Controllers\Api\V1\Auth\OTPController;
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\BidController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\DemandController;
use App\Http\Controllers\NilamBidController;
use App\Http\Controllers\NilamController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PaymentSettingController;
use App\Http\Controllers\PointsController;
use App\Http\Controllers\PointWithdrawRequestController;
use App\Http\Controllers\SeoController;
use Illuminate\Support\Facades\Route;
use Illuminate\Broadcasting\BroadcastController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::group(['prefix' => 'v1'], function () {

    // request for authentication
    Route::post('register', [LoginController::class, 'register']);
    Route::post('register/otp', [OTPController::class, 'sendRegisterOtp']);
    Route::post('login/otp', [OTPController::class, 'sendLoginOtp']);
    Route::post('login', [LoginController::class, 'login'])->name('login');
    // request for  authentication
    Route::get('setting/seo', [SeoController::class, 'getSeoData']);
    Route::get('send-sms', [DemandController::class, 'smsTest'])->name('send-sms'); //for sms test
    // authenticated route
    Route::group(['middleware' => 'auth:api'], function () {

        Route::post('broadcasting/auth', [BroadcastController::class, 'authenticate']);
        
        Route::post('logout', [LoginController::class, 'logout']);
        Route::get('user', [LoginController::class, 'getUser']);

        // demand and bid
        Route::post('demand', [DemandController::class, 'store']);
        Route::post('bid/{demand_id}', [BidController::class, 'store']);
        Route::get('check-bid/{demand_id}', [BidController::class, 'checkBid']);
        Route::post('bid-shortlist/{bid_id}', [BidController::class, 'toShortlist']);
        Route::get('shortlisted/user', [BidController::class, 'getShortlistCustomer']);
        Route::get('user-contact/{bid_id}', [BidController::class, 'getBidder']);
        Route::post('bid-confirm/{bid_id}', [BidController::class, 'confirmBid']);
        Route::post('bid-done/{bid_id}', [BidController::class, 'markAsDone']);
        Route::post('review-to-buyer/{bid_id}', [BidController::class, 'buyerReview']);
        Route::get('confirmed-bid/{demand_id}', [BidController::class, 'getConfirmBid']);

        // user payment
        Route::post('payment', [PaymentController::class, 'store']);
        Route::post('pay-online', [PaymentController::class, 'payOnline']);
        Route::get('get-unpaid-payment/{id}', [PaymentController::class, 'getUnpaidPayment']);
        Route::get('my-payment-list', [PaymentController::class, 'myPayment']);
        Route::get('payment/setting', [PaymentSettingController::class, 'edit']);

        // point recharge
        Route::post('add-point', [PointsController::class, 'store']);
        Route::post('point-payment', [PointsController::class, 'payOnline']);
        Route::get('my-recharge-list', [PointsController::class, 'myRecharge']);

        // user dashboard
        // Nilam
        Route::get('mynilam', [NilamController::class, 'myNilamList']);
        Route::get('my-nilam-bid', [NilamBidController::class, 'myBid']);
        Route::delete('nilam/{id}', [NilamController::class, 'destroy']);

        Route::get('my-demands', [DemandController::class, 'myDemandList']);
        Route::get('demand/{id}/edit/{slug}', [DemandController::class, 'edit']);
        Route::post('demand/update', [DemandController::class, 'update']);
        Route::delete('demand/{id}/destroy', [DemandController::class, 'destroy']);
        Route::get('my-bids', [BidController::class, 'myBid']);
        // Route::get('edit-profile', [UserController::class, 'edit']);
        Route::get('user/profile', [UserController::class, 'getuserProfile']);
        Route::post('update/profile', [UserController::class, 'update']);

        Route::post('update/bid', [BidController::class, 'update']);
        Route::delete('bid/{id}/destroy', [BidController::class, 'destroy']);

        // User Apply Coupon
        Route::get('user/coupon', [CouponController::class, 'userCoupon']);
        Route::post('apply/coupon', [CouponController::class, 'applyCoupon']);

        // upload demand image
        Route::post('image-upload', [DemandController::class, 'uploadImage']);
        Route::post('app-image-upload', [DemandController::class, 'uploadAppImage']);

        // Nilam
        Route::post('nilam', [NilamController::class, 'store']);
        Route::post('update/nilam/delivery/address', [NilamController::class, 'updateAddress']);
        Route::post('update/nilam/expire/time', [NilamController::class, 'updateExpireTime']);
        Route::post('nilam-bid', [NilamBidController::class, 'store']);
        Route::post('point/withdraw', [PointWithdrawRequestController::class, 'withdrawRequest']);

        // get count of dashboard post and bid

        Route::get('dasboard-count', [UserController::class, 'getCount']);

        //for notificaiton
        Route::get('notification', [UserController::class, 'getNotification']);
        Route::delete('notification/{id}', [UserController::class, 'destroyNotification']);
        Route::post('mark-notification', [UserController::class, 'showNotification']);
    });

    // end authencated route
    // sslcommerz payment

    Route::post('ssl-success', [PaymentController::class, 'paymentSuccess'])->name('ssl.success');
    Route::post('ssl-success-point', [PointsController::class, 'paymentSuccess'])->name('ssl.success.point');
    // general asset finding route
    Route::get('category-list', [AssetListController::class, 'getCategoryList']);
    Route::get('category-unit/{id}', [AssetListController::class, 'getCategoryUnit']);
    Route::get('area-list', [AssetListController::class, 'getAreaList']);

    // user public profile
    Route::get('user-public-information/{user_id}', [UserController::class, 'getUser']);
    Route::get('user-review-as-seller/{user_id}', [UserController::class, 'reviewAsSeller']);
    Route::get('user-review-as-buyer/{user_id}', [UserController::class, 'reviewAsBuyer']);

    // demand list
    Route::get('get-demand', [AssetListController::class, 'getDemand']); //new style take 8 demand
    Route::get('category-demand', [AssetListController::class, 'getCategoryDemand']); //previous style category demand
    Route::get('demand-list', [AssetListController::class, 'demandList']);
    // single   demand
    Route::get('demand/{id}', [DemandController::class, 'demandDetails']);


    // single category
    Route::get('category/{id}', [AssetListController::class, 'categoryShow']);
    // bid list
    Route::get('bid-list/{demand_id}', [BidController::class, 'getBidByDemand']);
    Route::get('count-bid-on-demand/{id}', [BidController::class, 'bidCountOnDemand']);

    /*
    /-------------------------------------------
    Nilam
    /-------------------------------------------
     */
    Route::get('get-latest-nilam', [AssetListController::class, 'getLatestNilam']);//new style take 8 nilam
    Route::get('category-nilam', [AssetListController::class, 'getCategoryNilam']);//previous style category nilam
    Route::get('get-nilam', [NilamController::class, 'getNilam']);
    Route::get('nilam-list', [AssetListController::class, 'nilamList']);
    Route::get('nilam/{id}', [NilamController::class, 'nilamDetails']);
    Route::get('nilam-bid-list/{id}', [NilamBidController::class, 'getNilamUser']);
    /*
    /-------------------------------------------
    End Nilam
    /-------------------------------------------
     */

    // counter for home page

    Route::get('counter', [AssetListController::class, 'counter']);

    // subscription plan list

    Route::get('subscription-plan-list', [AssetListController::class, 'getPlan']);
    Route::get('subscription-minimum-plan', [AssetListController::class, 'getMinimumPlan']);

    // get general seo setting

    Route::get('seo-data', [SeoController::class, 'getSeoData']);
    Route::get('faqs', [AssetListController::class, 'getFAQ']);

});
