<?php

use App\Http\Controllers\DemandController;
use App\Events\Notify;
use Illuminate\Support\Facades\Route;
// use Illuminate\Broadcasting\BroadcastController;
use App\Models\User;
use App\Models\Bid\Bid;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', function () {
	return view('errors.404');
});

Route::get('/echo', function () {
	return view('welcome');
});

Route::get('category-demand', [DemandController::class, 'getCategoryDemand']);

Route::get('/broadcast', function () {
    $bid = Bid::find(66);
    broadcast(new Notify($bid));
    // broadcast(new \App\Events\Notify($bid));
});

// Route::post('broadcasting/auth', [BroadcastController::class, 'authenticate'])
//         ->middleware(BroadcastMiddleware::class);