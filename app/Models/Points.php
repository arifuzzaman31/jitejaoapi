<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Points extends Model
{
    use HasFactory;

    // relation with user

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
