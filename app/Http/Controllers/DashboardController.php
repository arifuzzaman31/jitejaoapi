<?php

namespace App\Http\Controllers;

use App\Models\Bid\Bid;
use App\Models\Demand\Demand;
use App\Models\User;

class DashboardController extends Controller
{
    public function getdashboard()
    {

        $user          = User::count();
        $lastWeekUser  = User::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-7 days')))->count();
        $lastMonthUser = User::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-1 month')))->count();

        $demand          = Demand::count();
        $lastWeekDemand  = Demand::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-7 days')))->count();
        $lastMonthDemand = Demand::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-1 month')))->count();

        $bid          = Bid::count();
        $lastWeekBid  = Bid::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-7 days')))->count();
        $lastMonthBid = Bid::whereDate('created_at', '>=', date('Y-m-d H:i:s', strtotime('-1 month')))->count();

        return response()->json(
            [
                'total_user'       => $user,
                'lastweek_user'    => $lastWeekUser,
                'lastmonth_user'   => $lastMonthUser,
                'total_demand'     => $demand,
                'lastweek_demand'  => $lastWeekDemand,
                'lastmonth_demand' => $lastMonthDemand,
                'total_bid'        => $bid,
                'lastweek_bid'     => $lastWeekBid,
                'lastmonth_bid'    => $lastMonthBid,
            ]);
    }
}
