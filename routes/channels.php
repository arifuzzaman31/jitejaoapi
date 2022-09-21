<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
	return true;
});


Broadcast::channel('notification_demand_bid.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
    // return $user->id == (int) \App\Models\Bid\Bid::find($id)->demander_id;
    return true;
});

// Broadcast::channel('new_bid_on_demand.{id}', function ($user, $id) {
//     return true;
// });
