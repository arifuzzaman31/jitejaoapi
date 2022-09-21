<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    public function setTitleAttribute($value)
    {
    	$this->attributes['title'] = $value;
    	$this->attributes['slug'] = $this->slugy($value);
    }

    private function slugy($value)
    {
    	$service = str_replace(' ', '-', strtolower($value));
    	$count = Service::where('slug','LIKE',$service.'%')->count();
    	$newSlug = $count ? $count+1 : '';
    	$service .= $newSlug;
    	return $service;
    }
}
