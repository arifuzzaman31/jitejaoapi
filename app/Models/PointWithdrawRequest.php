<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Admin\Admin;

class PointWithdrawRequest extends Model
{
    use HasFactory;

    public function user()
    {
    	return $this->belongsTo(User::class)
    		->withDefault([
    			'id' => 0,
    			'name' => 'Unknown',
    			'email' => 'unknown@mail.com',
    			'mobile_no' => 'unknown'
    		]);
    }

    public function admin()
    {
    	return $this->belongsTo(Admin::class)
    		->withDefault([
    			'id' => 0,
    			'name' => 'Unknown',
    			'email' => 'unknown@mail.com',
    			'phone' => 'unknown'
    		]);
    }
}
