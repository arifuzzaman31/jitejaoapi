<?php
namespace App\Sms;

use App\Helpers\AllStatic;
use App\Models\Demand\Demand;
use App\Models\Sendsms;
use App\Models\Sms;
use App\Sms\AdnSms;

class SendNotification
{
// /usr/local/bin/php /home/blhost/public_html/api/artisan send:sms >> /dev/null 2>&1
    public function __construct()
    {
        $this->sendSms();
    }

    public function sendSms()
    {
        $sms_setting = Sms::first();
        if ($sms_setting->status == 1) {

            $jobs = Sendsms::where('status', AllStatic::$inactive)->get();

            foreach ($jobs as $job) {
                if ($job) {
                    $demand = Demand::with('category.user')
                        ->where('id', $job->demand_id)
                        ->where('bid_status', AllStatic::$not_confirm)
                        ->where('expire_date', '>', date('Y-m-d'))
                        ->where('sms_status', AllStatic::$inactive)
                        ->first();

                    if ($demand) {

                        $demand_number = $demand->category->user;
                        if ($sms_setting->demand_sms_location_status == 1) {
                            $demand_number = collect($demand_number)->where('area_id', '=', $demand->area_id);
                        }
                        $demand_number = $demand_number->pluck('mobile_no')->toArray();
                        $message       = "আপনার ক্যাটাগরিতে একটি ডিমান্ড পড়েছে! ভিজিট করুনঃ " . env('FRONT_URL') . '/demand/' . $demand->id . '/' . uniqueString();

                        if (count($demand_number) > 0) {
                            $numbers = array_slice($demand_number, 0, 100);
                            foreach ($numbers as $value) {
                                // sending sms using adn sms api
                                AdnSms::sendSingleSms($value, $message, 'TEXT');
                            }
                        }

                        $demand->sms_status = AllStatic::$active;
                        $demand->update();

                    }

                    $job->delete();
                }
            }
        }

    }
}
