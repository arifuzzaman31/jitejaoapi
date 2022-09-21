<?php

namespace App\Repository\Bid;

use App\Models\Bid\Bid;

class BidRepository
{
    public function userBids($data = [], $user_id)
    {
        $per_page = 6;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $bids = Bid::with(['demand.user', 'demand.demand_rating', 'bid_rating'])
            ->where('user_id', '=', $user_id)
            ->orderBy('updated_at', 'desc');

        if ($data['is_shortlisted'] != '') {
            $bids->where('is_shortlisted', '=', $data['is_shortlisted']);
        }
        if ($data['is_done'] != '') {
            $bids->where('is_done', '=', $data['is_done']);
        }

        if ($data['from_date'] != '' && $data['end_date'] != '') {
            $start_date = date('Y-m-d',strtotime($data['from_date']))." 00:00:00";
            $end_date    = date('Y-m-d',strtotime($data['end_date']))." 23:59:59";

            $bids->whereBetween('created_at',[$start_date,$end_date]);
        }

        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $bids->take($data['take_only']);
            }

            $bids = $bids->get();
        } else {
            $bids = $bids->paginate($per_page);
        }

        return $bids;

    }

    public function getBidByDemand($data = [], $demand_id)
    {
        // return $demand_id;
        $per_page = 10;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }

        $bids = Bid::with(['demand.user'])
            ->where('demand_id', '=', $demand_id)
            ->orderBy('updated_at', 'desc');

        if ($data['is_shortlisted'] != '') {
            $bids->where('is_shortlisted', '=', $data['is_shortlisted']);
        }
        
        if ($data['is_done'] != '') {
            $bids->where('is_done', '=', $data['is_done']);
        }

        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $bids->take($data['take_only']);
            }

            $bids = $bids->get();
        } else {
            $bids = $bids->paginate($per_page);
        }

        return $bids;

    }
}
