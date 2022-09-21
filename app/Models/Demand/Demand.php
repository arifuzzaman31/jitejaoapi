<?php

namespace App\Models\Demand;

use App\Helpers\AllStatic;
use App\Models\Bid\Bid;
use App\Models\BuyerRating;
use App\Models\Category\Category;
use App\Models\Location\Area;
use App\Models\Setting\QuantityUnit;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Demand extends Model
{
    use HasFactory;

    public function bid()
    {
        return $this->hasMany(Bid::class);
    }

    public function win_bid()
    {
        return $this->hasOne(Bid::class)->where('is_confirmed', '=', AllStatic::$active);
    }

    public function quantity_unit()
    {
        return $this->belongsTo(QuantityUnit::class)->withDefault(
            [
                'id'           => 0,
                'name'         => 'QTY',
                'english_name' => 'QTY',
            ]
        );
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class)->withDefault([
            "id"           => 0,
            "name"         => "N/A",
            "english_name" => "N/A",
        ]);
    }

    public function scopeLatestFour()
    {

        return $this->orderBy('id', 'desc')->take(4);
    }

    public function area()
    {
        return $this->belongsTo(Area::class)->withDefault([
            'id'                => 0,
            'area_name'         => 'N/A',
            'area_english_name' => 'N/A',
        ]);
    }

    public function demand_rating()
    {
        return $this->hasOne(BuyerRating::class, 'demand_id', 'id');
    }
}
