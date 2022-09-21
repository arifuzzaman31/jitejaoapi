<?php

namespace App\Sms;

use App\Models\Sms as SmsModel;

/**
 *
 */
class AdnSms
{

    public static function sendSingleSms($number, $message, $type = 'TEXT')
    {
        $sms_setting = SmsModel::first();
        $data        = [
            'api_key'      => $sms_setting->api_key,
            'api_secret'   => $sms_setting->api_secret,
            'request_type' => "SINGLE_SMS",
            'message_type' => $type,
            'mobile'       => $number,
            'message_body' => $message,
        ];

        $curl = curl_init();

        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_URL, 'https://portal.adnsms.com/api/v1/secure/send-sms');
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($curl);
        $err      = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return "cURL Error #:" . $err;
        } else {
            return $response;
        }
    }
}
