<?php

namespace App\Models\Category;

use App\Models\Demand\Demand;
use App\Models\Nilam;
use App\Models\Setting\QuantityUnit;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsToMany(User::class, 'user_categories');
    }

    // relation with demand

    public function demands()
    {
        $active       = 1;
        $not_confirm  = 0;
        $current_date = date('Y-m-d');
        return $this->hasMany(Demand::class)
            ->orderBy('id', 'desc')
            ->where('bid_status', '=', $not_confirm)
            ->where('expire_date', '>=', $current_date)
            ->where('status', '=', $active);
    }

    public function nilams()
    {
        $active = 1;
        // $not_confirm  = 0;
        $current_date = date('Y-m-d H:i:s');
        return $this->hasMany(Nilam::class)
            ->orderBy('expire_date', 'asc')
        // ->where('bid_status', '=', $not_confirm)
            ->where('expire_date', '>=', $current_date)
            ->where('status', '=', $active);

    }

    public function quantity_unit()
    {
        return $this->belongsToMany(QuantityUnit::class, 'category_quantity_units');
    }
}
