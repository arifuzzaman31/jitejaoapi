<?php

namespace App\Models\Bid;

use App\Models\Demand\Demand;
use App\Models\SellerRating;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bid extends Model
{
    use HasFactory;

    public function demand()
    {
        return $this->belongsTo(Demand::class)->withDefault([
            'id'     => 0,
            'title'   => 'This Demand no longer anymore!',
            'image_one' => null,
            'image_two' => null,
            'image_three' => null
        ]);
    }

    public function user()
    {
        return $this->belongsTo(User::class)->withDefault([
            'id'     => 0,
            'name'   => 'N/A',
            'avatar' => null,
        ]);
    }
    public function demander()
    {
        return $this->belongsTo(User::class, 'demander_id', 'id')->withDefault([
            'id'     => 0,
            'name'   => 'N/A',
            'avatar' => null,
        ]);
    }

    public function bid_rating()
    {
        return $this->hasOne(SellerRating::class, 'bid_id', 'id');
    }

    // public function user()
    // {
    //     return $this->hasOne('App\Models\User','id','user_id');
    // }
}
