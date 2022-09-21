<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\Pivot;

class UserCategory extends Pivot
{
    use HasFactory;
    protected $table   = "user_categories";
    public $timestamps = false;

    // public function sendsms()
    // {
    // 	return $this->belongsToMany('App\Models\Sendsms','id');
    // }
}
