<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Career extends Model
{
    use HasFactory;

    public function setTitleAttribute($value)
    {
    	$this->attributes['title'] = $value;
    	$this->attributes['slug'] = $this->slugy($value);
    }

    private function slugy($value)
    {
    	$slug = str_replace(' ', '-', strtolower($value));
    	$count = Career::where('slug','LIKE',$slug.'%')->count();
    	$newSlug = $count ? $count+1 : '';
    	$slug .= $newSlug;
    	return $slug;
    }
}
