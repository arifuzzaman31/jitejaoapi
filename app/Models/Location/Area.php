<?php

namespace App\Models\Location;

use App\Models\Demand\Demand;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->hasMany('App\Models\User');
    }
    public function demand()
    {
        return $this->hasMany(Demand::class);
    }
}
