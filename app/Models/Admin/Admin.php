<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    use HasFactory;

        /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function blog()
    {
        return $this->hasMany('App\Models\Blog');
    }

    public function role()
    {
        return $this->belongsTo('App\Models\Role');
    }

    public function payment()
    {
        return $this->hasOne('App\Models\Payment');
    }

    public function delivery_history()
    {
        return $this->hasOne('App\Models\DeliveryHistory');
    }

    public function point_withdraw_request()
    {
        return $this->hasMany('App\Models\PointWithdrawRequest');
    }


    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
