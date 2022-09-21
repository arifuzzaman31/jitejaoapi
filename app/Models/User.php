<?php

namespace App\Models;

use App\Models\Category\Category;
use App\Models\Location\Area;
use App\Models\User\UserInformation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function category()
    {
        return $this->belongsToMany(Category::class, 'user_categories');
    }

    public function area()
    {
        return $this->belongsTo(Area::class)->withDefault([
            'id'                => 0,
            'area_name'         => 'N/A',
            'area_english_name' => 'N/A',
        ]);
    }

    // relation with user information

    public function user_information()
    {
        return $this->hasOne(UserInformation::class);
    }

    // relation with seller review

    public function seller_rating()
    {
        return $this->hasMany(SellerRating::class, 'seller_id', 'id');
    }

    // relation with buyer rating

    public function buyer_rating()
    {
        return $this->hasMany(BuyerRating::class, 'buyer_id', 'id');
    }

    public function user_coupon()
    {
        return $this->hasOne('App\Models\UserCoupon');
    }

    public function nilam()
    {
        return $this->hasMany('App\Models\Nilam');
    }

    public function nilam_bid()
    {
        return $this->hasMany('App\Models\NilamBid');
    }

    public function point_withdraw_request()
    {
        return $this->hasMany('App\Models\PointWithdrawRequest');
    }

}
