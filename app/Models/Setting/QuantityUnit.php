<?php

namespace App\Models\Setting;

use App\Models\Category\Category;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuantityUnit extends Model
{
    use HasFactory;

    public function category()
    {
        return $this->belongsToMany(Category::class, 'category_quantity_units');
    }
}
