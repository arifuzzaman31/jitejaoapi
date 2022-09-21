<?php
namespace App\Repository\Customer;

use App\Helpers\AllStatic;
use App\Models\User;

class UserRepository {
	public function getBuyerList($data = []) {
		$per_page = 10;
		if ($data['per_page']) {
			$per_page = $data['per_page'];
		}
		$keyword = $data['keyword'];
		$buyers = User::where('is_seller', '=', AllStatic::$buyer)->orderBy('buyer_badge', 'desc');
		if ($keyword) {
			$buyers->where(function ($query) use ($keyword) {
				$query->where('name', 'LIKE', '%' . $keyword . '%')
					->orWhere('email', 'LIKE', '%' . $keyword . '%');
			});
		}

		if ($data['status'] != '') {
			$buyers->where('status', '=', $data['status']);
		}

		if ($data['no_pagination']) {
			if ($data['take_only']) {
				$buyers->take($data['take_only']);
			}
			$buyers = $buyers->get();
		} else {
			$buyers = User::paginate($per_page);
		}

		return $buyers;
	}

	public function getSingleCategoryWithSeller($category_id) {
		$category = User::with(['user', function ($query) {
			$query->where('is_seller', '=', AllStatic::$seller)
				->where('status', '=', AllStatic::$active);
		}])->find($category_id);

		return $category;
	}

	public function getBuyerWithArea($data = []) {
		$per_page = 10;
		if ($data['per_page']) {
			$per_page = $data['per_page'];
		}
		$keyword = $data['keyword'];
		$buyers = User::with(['area:id,area_name,area_english_name','user_information'])
			->orderBy('buyer_badge', 'desc');
		if ($keyword) {
			$buyers->where(function ($query) use ($keyword) {
				$query->where('name', 'LIKE', '%' . $keyword . '%')
					->orWhere('id', 'LIKE', '%' . $keyword . '%')
					->orWhere('email', 'LIKE', '%' . $keyword . '%');
			});
		}

		if ($data['status'] != '') {
			$buyers->where('status', '=', $data['status']);
		}

		if ($data['area'] != '' && $data['area'] != 'undefined') {
			$buyers->where('area_id', '=', $data['area']);
		}

		if ($data['no_pagination']) {
			if ($data['take_only']) {
				$buyers->take($data['take_only']);
			}
			$buyers = $buyers->get();
		} else {
			$buyers = $buyers->paginate($per_page);
		}

		return $buyers;
	}

	public function getSellerWithArea($data = []) {
		$per_page = 10;
		if ($data['per_page']) {
			$per_page = $data['per_page'];
		}
		$keyword = $data['keyword'];
		$buyers = User::with(['area:id,area_name,area_english_name','user_information'])
		// ->where('is_seller', '=', AllStatic::$seller)
		->orderBy('buyer_badge', 'desc');
		if ($keyword) {
			$buyers->where(function ($query) use ($keyword) {
				$query->where('name', 'LIKE', '%' . $keyword . '%')
					->orWhere('id', 'LIKE', '%' . $keyword . '%')
					->orWhere('email', 'LIKE', '%' . $keyword . '%');
			});
		}

		if ($data['status'] != '') {
			$buyers->where('status', '=', $data['status']);
		}

		if ($data['area'] != '' && $data['area'] != 'undefined') {
			$buyers->where('area_id', '=', $data['area']);
		}

		if ($data['no_pagination']) {
			if ($data['take_only']) {
				$buyers->take($data['take_only']);
			}
			$buyers = $buyers->get();
		} else {
			$buyers = $buyers->paginate($per_page);
		}

		return $buyers;
	}
}
