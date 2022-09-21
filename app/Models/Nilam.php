<?php

namespace App\Models;

use App\Models\Category\Category;
use App\Models\Location\Area;
use App\Models\Setting\QuantityUnit;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Nilam extends Model {
	use HasFactory;

	public function user() {
		return $this->belongsTo(User::class);
	}

	public function nilam_bid() {
		return $this->hasMany(NilamBid::class);
	}

	// public function nilam_bid_count() {
	// 	return $this->hasMany(NilamBid::class)->count();
	// }

	public function quantity_unit() {
		return $this->belongsTo(QuantityUnit::class)->withDefault(
			[
				'id' => 0,
				'name' => 'QTY',
				'english_name' => 'QTY',
			]
		);
	}

	public function category() {
		return $this->belongsTo(Category::class)->withDefault([
			"id" => 0,
			"name" => "N/A",
			"english_name" => "N/A",
		]);
	}

	public function area() {
		return $this->belongsTo(Area::class)->withDefault([
			'id' => 0,
			'area_name' => 'N/A',
			'area_english_name' => 'N/A',
		]);
	}

	public function win_bid() {
		return $this->hasOne(NilamBid::class)->where('disversed_status', '=', 0)->latest();
	}

	public function some_nilam_bid() {
		return $this->hasMany(NilamBid::class, 'nilam_id')
			->orderBy('bid_price', 'desc')->take(10);
	}

}
