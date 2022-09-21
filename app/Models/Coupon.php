<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;

    public function user_coupon()
    {
    	return $this->belongsTo('App\Models\UserCoupon','coupon_code','coupon_code');
    }
}
