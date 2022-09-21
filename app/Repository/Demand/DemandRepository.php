<?php

namespace App\Repository\Demand;

use App\Helpers\AllStatic;
use App\Models\Demand\Demand;

class DemandRepository
{

    // get all demand
    public function getDemand($data = [])
    {

        $current_date = date('Y-m-d');
        $per_page     = 8;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $demands = Demand::with(['user:id,name,avatar,buyer_badge', 'quantity_unit'])
            ->where('bid_status', '=', AllStatic::$not_confirm)
            ->where('expire_date', '>=', $current_date)
            ->where('status', '=', AllStatic::$active)
            ->orderBy('id', 'desc');

        if ($data['category'] != '' && $data['category'] != 'undefined') {
            $demands->where('category_id', '=', $data['category']);
        }
        if ($data['area'] != '' && $data['area'] != 'undefined') {
            $demands->where('area_id', '=', $data['area']);
        }
        if ($data['keyword'] != '' && $data['keyword'] != 'undefined') {
            $demands->where('title', 'LIKE', '%' . $data['keyword'] . '%');
        }

        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $demands->take($data['take_only']);
            }

            $demands = $demands->get();
        } else {
            $demands = $demands->paginate($per_page);
        }

        return $demands;
    }
    // get user demand

    public function userDemands($data = [], $user_id)
    {
        $per_page = 6;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $demands = Demand::with(['demand_rating', 'win_bid.user', 'win_bid.bid_rating'])
            ->where('user_id', '=', $user_id)
            ->orderBy('updated_at', 'desc');

        if ($data['bid_status'] != '') {
            $demands->where('bid_status', '=', $data['bid_status']);
        }

        if ($data['from_date'] != '' && $data['end_date'] != '') {
            $start_date = date('Y-m-d',strtotime($data['from_date']))." 00:00:00";
            $end_date    = date('Y-m-d',strtotime($data['end_date']))." 23:59:59";

            $demands->whereBetween('created_at',[$start_date,$end_date]);
        }

        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $demands->take($data['take_only']);
            }

            $demands = $demands->get();
        } else {
            $demands = $demands->paginate($per_page);
        }

        return $demands;

    }

}
