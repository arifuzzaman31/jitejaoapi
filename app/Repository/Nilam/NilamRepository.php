<?php
namespace App\Repository\Nilam;

use App\Helpers\AllStatic;
use App\Models\Nilam;
use App\Models\NilamBid;

class NilamRepository
{
    // get all nilam
    public function getNilam($data = [])
    {
        $current_date = date('Y-m-d H:i:s');
        $per_page     = 8;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $nilams = Nilam::with(['user:id,name,avatar,buyer_badge', 'quantity_unit', 'win_bid'])
            ->where('expire_date', '>=', $current_date)
            ->where('status', '=', AllStatic::$active)
            ->orderBy('id', 'desc');
        if ($data['category'] != '') {
            $nilams->where('category_id', '=', $data['category']);
        }
        if ($data['area'] != '') {
            $nilams->where('area_id', '=', $data['area']);
        }

        if ($data['keyword'] != '') {
            $nilams->where('title', 'LIKE', '%' . $data['keyword'] . '%');
        }
        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $nilams->take($data['take_only']);
            }
            $nilams = $nilams->get();
        } else {
            $nilams = $nilams->paginate($per_page);
        }
        return $nilams;
    }

    public function userNilam($data = [], $user_id)
    {
        $per_page = 6;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $nilams = Nilam::with(['win_bid.bid_user', 'win_bid'])
            ->where('user_id', '=', $user_id)
            ->orderBy('updated_at', 'desc');

        if ($data['only_expired'] != '') {
            $nilams->where('expire_date', '<', date('Y-m-d H:i:s'));
        }

        if ($data['only_active'] != '') {
            $nilams->where('expire_date', '>', date('Y-m-d H:i:s'));
        }

        if ($data['no_paginate']) {
            if ($data['take_only']) {
                $nilams->take($data['take_only']);
            }

            $nilams = $nilams->get();
        } else {
            $nilams = $nilams->paginate($per_page);
        }

        return $nilams;

    }

    public function userBids($data = [], $user_id)
    {
        $per_page = 6;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $bids = NilamBid::with(['nilam.user', 'nilam.win_bid'])
            ->where('user_id', '=', $user_id)
            ->where('user_bid_status', '=', 1)
            ->orderBy('updated_at', 'desc');

        // if ($data['is_shortlisted'] != '') {
        //     $bids->where('is_shortlisted', '=', $data['is_shortlisted']);
        // }
        // if ($data['is_shortlisted'] != '') {
        //     $bids->where('is_shortlisted', '=', $data['is_shortlisted']);
        // }
        // if ($data['is_done'] != '') {
        //     $bids->where('is_done', '=', $data['is_done']);
        // }

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
