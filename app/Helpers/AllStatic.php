<?php

namespace App\Helpers;

class AllStatic
{

    public static $active   = 1;
    public static $inactive = 0;

    // Bid Status
    public static $confirm     = 1;
    public static $not_confirm = 0;

    // Coupon Type
    public static $for_all     = 1;
    public static $for_specific = 0;

    // badge
    public static $no_badge = 0;
    public static $sliver   = 1;
    public static $blue     = 2;
    public static $pink     = 3;

    // seller

    public static $seller = 1;
    public static $buyer  = 0;

    // Subscription payment

    public static $offline_pay = 0;
    public static $online_pay  = 1;

    // payment status

    public static $paid   = 1;
    public static $unpaid = 1;

    //Delivery Status
    public static $pending    = 0;
    public static $picked     = 1;
    public static $processing = 2;
    public static $on_delivery= 3;
    public static $delivered  = 4;

}
