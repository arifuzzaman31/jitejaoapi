<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NilamBid extends Model
{
    use HasFactory;

    public function nilam()
    {
    	return $this->belongsTo(Nilam::class);
    }

    public function user()
    {
    	return $this->belongsTo(User::class,'nilam_user_id');
    }

    public function bid_user()
    {
    	return $this->belongsTo(User::class,'user_id');
    }
}
