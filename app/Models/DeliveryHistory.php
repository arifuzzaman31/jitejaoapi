<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// use App\Models\Admin\Admin;

class DeliveryHistory extends Model
{
    use HasFactory;

    public function admin()
    {
    	return $this->belongsTo('App\Models\Admin\Admin')
    			->withDefault([
    				'id' => 0,
    				'name' => 'Unknown',
    				'email' => 'Unknown',
    				'phone' => 'Unknown'
    			]);
    }
}
