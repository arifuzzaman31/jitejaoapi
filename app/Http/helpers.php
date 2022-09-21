<?php
use Illuminate\Support\Facades\DB;

function currentFileSystem() {
	$file_system = env('CURRENT_FILE_SYSTEM');
	return $file_system ? $file_system : 'public';
}

function uniqueString() {
	$letter = 'abcdefghijklmnopqrstuvwxyz0987654321';
	return substr(str_shuffle($letter), 0, 6);
}

function fileBaseUrl() {
	// $file_system = env('CURRENT_FILE_SYSTEM');
	// if ($file_system == 's3') {
	// 	return "https://s3.demandkorun.com/images";
	// }
	// return url(env('PUBLIC_IMAGE_PATH'));

	$file_system = 'public';
	if ($file_system == 's3') {
		return "https://s3.demandkorun.com/images";
	}
	return url('images/');
	// return url('images');
}

function sideMenu($role_id) {
	$parent = DB::table('menus')
		->select(DB::raw('menus.id, menus.name, menus.menu_url, menus.parent_id, menus.icon'))
		->join('permissions', 'permissions.menu_id', '=', 'menus.id')
		->where('permissions.role_id', $role_id)
		->orderBy('menus.president', 'ASC')
		->where('menus.parent_id', 0)
		->get();

	$sidmenu = [];
	foreach ($parent as $value) {
		$menus = [];
		$menus['id'] = $value->id;
		$menus['name'] = $value->name;
		$menus['url'] = $value->menu_url;
		$menus['icon'] = $value->icon;
		$menus['parent_id'] = $value->parent_id;

		if ($value->menu_url != null) {

			$menus['sub_menu'] = [];
		} else {

			$menus['sub_menu'] = subMenu($role_id, $value->id);

		}

		array_push($sidmenu, $menus);

	}

	return $sidmenu;

}

function subMenu($role_id, $id) {

	return DB::table('menus')
		->select(DB::raw('menus.id, menus.name, menus.menu_url, menus.parent_id, menus.icon'))
		->join('permissions', 'permissions.menu_id', '=', 'menus.id')
		->where('permissions.role_id', $role_id)
		->where('menus.parent_id', '=', $id)
		->orderBy('president', 'ASC')
		->get()->toArray();
}

function makeNested($source) {
	$menu = array();

	$sub_menu = array();

	$new_menu = [];

	foreach ($source as &$s) {
		if ($s['parent_id'] == 0) {
			// no parent_id so we put it in the root of the array
			$menu[] = &$s;
		}
		if ($s['parent_id'] != 0) {
			// it have  parent id so making child id
			$sub_menu[] = &$s;
		}
	}

	// in this loop we are puting child into there parent
	foreach ($menu as $key => $value) {
		$value['sub_menu'] = [];
		foreach ($sub_menu as $sk => $sub) {

			if ($value['id'] == $sub['parent_id']) {

				array_push($value['sub_menu'], $sub);

			}
		}

		array_push($new_menu, $value);
	}

	return $new_menu;
}

function generateMonthBetween($month_from, $month_to) {
	$output = [];
	$time = strtotime($month_from);
	$last = date('Y-m', strtotime($month_to));

	do {
		$month = date('Y-m', $time);
		array_push($output, $month);

		$time = strtotime('+1 month', $time);
	} while ($month != $month_to);

	return $output;
}

function dayHourMinute($date) {
	$now = time();
	$your_date = strtotime($date);
	$datediff = $your_date - $now;
	$day = floor($datediff / (60 * 60 * 24));
	$hour = floor($datediff / (60 * 60)) % 24; //hours
	$minute = floor($datediff / (60)) % 60; //minutes
	$second = $datediff % 60; //seconds

	if ($day > 0) {
		return $day . " দিন";
	}
	if ($hour > 0) {
		return $hour . " ঘন্টা";
	}
	// default return minute
	if ($minute > 0) {
		return $minute . " মিনিট";
	}
	if ($second > 0) {
		return $second . " সেকেন্ড";
	}

	return "সময় শেষ";
}

function DeliveryStatus($status) {
	switch ($status) {
	case 1:
		return 'Picked';
		break;
	case 2:
		return 'Processing';
		break;
	case 3:
		return 'On Delivery';
		break;
	case 4:
		return 'Delivered';
		break;

	default:
		return 'Pending';
		break;
	}
}

function stateOfTheBid($bid) {
	$status = 'pending';
	if ($bid->is_shortlisted == 1) {
		 $status = 'shortlisted';
	}
	if ($bid->is_confirmed == 1) {
		 $status = 'confirmed';
	}
	if ($bid->is_done == 1) {
		$status = 'completed';
	}
	return $status;
	
}
