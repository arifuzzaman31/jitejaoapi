<?php
namespace App\Repository\Area;

use App\Models\Location\Area;

class AreaRepository
{
    public function getAreaList($data = [])
    {
        $per_page = 10;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $keyword = $data['keyword'];
        $area    = Area::orderBy('area_name', 'asc');
        if ($keyword) {
            $area->where(function ($query) use ($keyword) {
                $query->where('area_name', 'LIKE', '%' . $keyword . '%')
                    ->orWhere('area_english_name', 'LIKE', '%' . $keyword . '%');
            });
        }

        if ($data['status'] != '') {
            $area->where('status', '=', $data['status']);
        }

        if ($data['no_pagination']) {
            if ($data['take_only']) {
                $area->take($data['take_only']);
            }
            $area = $area->get();
        } else {
            $area = Area::paginate($per_page);
        }

        return $area;
    }

}
