<?php

namespace App\Models;

use App\Models\Bid\Bid;
use App\Models\Demand\Demand;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SellerRating extends Model
{
    use HasFactory;

    // relation with reviewer

    public function reviewer()
    {
        return $this->belongsTo(User::class, 'reviewer_id', 'id');
    }

    // relation with demand
    public function demand()
    {
        return $this->belongsTo(Demand::class, 'demand_id', 'id');
    }

    // relation with bid

    public function bid()
    {
        return $this->belongsTo(Bid::class);
    }
}
