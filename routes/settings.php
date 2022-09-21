<?php
use App\Http\Controllers\AreaController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PaymentSettingController;
use App\Http\Controllers\BidSettingController;
use App\Http\Controllers\QuantityUnitController;
use App\Http\Controllers\SendCouponController;
use App\Http\Controllers\SeoController;
use App\Http\Controllers\SmsController;
use App\Http\Controllers\SubscriptionPlanController;
use Illuminate\Support\Facades\Route;

// all admin related route will be here

Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function () {
    //contact
    Route::resource('coupon', CouponController::class);
    Route::get('coupon-list', [CouponController::class, 'couponList']);
    Route::resource('send-coupon', SendCouponController::class);
    Route::get('user-coupon-list', [SendCouponController::class, 'userCouponList']);

    //payment-settings
    Route::resource('payment-settings', PaymentSettingController::class);

    //Bid-settings
    Route::resource('bid-setting', BidSettingController::class);

    // subscription plan setting
    Route::resource('subscription', SubscriptionPlanController::class);
    Route::get('subscription-plan-list', [SubscriptionPlanController::class, 'planList']);

    //Report
    Route::get('report', [PaymentController::class, 'index'])->name('payment/report');
    Route::get('payment-report', [PaymentController::class, 'getPrinfPdf']);
    Route::get('get-all-payment', [PaymentController::class, 'getReport']);

    // SEO
    Route::resource('seo', SeoController::class);
    Route::get('setting/seo', [SeoController::class, 'getSeoData']);
    Route::post('update/seo', [SeoController::class, 'update']);

    // payment
    Route::get('payment/{id}', [PaymentController::class, 'show']);
    Route::put('payment/{id}', [PaymentController::class, 'update']);

    //SMS Setting
    Route::resource('sms', SmsController::class);
    // Category

    Route::resource('category', CategoryController::class);
    Route::get('category-list', [CategoryController::class, 'categoryList']);

    // quantity unit
    Route::resource('quantity-unit', QuantityUnitController::class);
    Route::get('quantity-unit-list', [QuantityUnitController::class, 'unitList']);
    // area
    Route::resource('area', AreaController::class);
    Route::get('area-list', [AreaController::class, 'areaList']);

    // Customer
    Route::resource('customer', CustomerController::class);
    Route::get('user/{id}', [CustomerController::class, 'getUserByid']);
    Route::get('buyer', [CustomerController::class, 'buyerList'])->name('buyer');
    Route::get('get-buyer', [CustomerController::class, 'getBuyer']);
    Route::get('seller', [CustomerController::class, 'sellerList'])->name('seller');
    Route::get('get-seller', [CustomerController::class, 'getSeller']);
    // end demandear

});
