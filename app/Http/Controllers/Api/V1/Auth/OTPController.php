<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\Http\Controllers\Controller;
use App\Models\Api\V1\Auth\OTP;
use App\Models\User;
use App\Sms\AdnSms;
use Illuminate\Http\Request;
use Throwable;

class OTPController extends Controller
{

    public function sendLoginOtp(Request $request)
    {

        $request->validate([
            'mobile_no' => 'required|size:11|regex:/(01)[0-9]{9}/',
        ], [
            'mobile_no.required' => 'মোবাইল নাম্বার দিন',
            'mobile_no.size'     => 'মোবাইল নাম্বার ১১ ডিজিট হতে হবে',
            'mobile_no.regex'    => 'ভুল মোবাইল  নাম্বার দিয়েছেন',
        ]);
        try
        {

            $user = User::where('mobile_no', $request->mobile_no)->first();
            if ($user) {

                $phone = $request->mobile_no;
                $code  = rand(1000, 9999);

                $message = 'Jitejao: '.$code.' is Your Login OTP Code.';
                // SendSms
                AdnSms::sendSingleSms($phone, $message, 'TEXT');
                // Saving opt to database
                $this->saveOtp($phone, $code, 1);

                return response()->json(['status' => 'success', 'message' => 'Otp Sended']);

            } else {
                return response()->json(['status' => 'error', 'message' => 'এই ফোন নাম্বারে কোন একাউন্ট নাই'], 400);
            }
        } catch (Throwable $e) {

            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }

    }

    public function sendRegisterOtp(Request $request)
    {
        $request->validate(
            [
                'name'      => 'required',
                'area'      => 'required',
                'mobile_no' => 'required|size:11|regex:/(01)[0-9]{9}/|unique:users,mobile_no',
                'email'     => 'nullable|email|unique:users,email',
                'category'  => 'required_if:is_seller,true|nullable|array|min:1|max:5',
            ],
            [
                'name.required'        => 'আপনার নাম দিন',
                'area.required'        => 'লোকেশন সিলেক্ট করুন',
                'mobile_no.required'   => 'মোবাইল নাম্বার দিন',
                'mobile_no.size'       => 'মোবাইল নাম্বার ১১ ডিজিট হতে হবে',
                'mobile_no.regex'      => 'ভুল মোবাইল  নাম্বার দিয়েছেন',
                'mobile_no.unique'     => 'এই নাম্বারে অলরেডি  অ্যাকাউন্ট রয়েছে',
                'email.unique'         => 'এই ইমেল অন্য একাউন্ট  এ রয়েছে',
                'category.required_if' => 'ক্যাটাগরি সিলেক্ট করুন',
                'category.min'         => 'মিনিমাম ১টি ক্যাটাগরি সিলেক্ট করুন',
                'category.max'         => 'ম্যাক্সিমাম  5 টি ক্যাটাগরিতে সেল করতে পারবেন',
            ]
        );
        try
        {
            $phone = $request->mobile_no;
            $code  = rand(1000, 9999);

            $message = 'your otp code for login is : ' . $code;
            // SendSms
            AdnSms::sendSingleSms($phone, $message, 'TEXT');
            // Saving otp to database
            $this->saveOtp($phone, $code, 2);
            return response()->json(['status' => 'success', 'message' => 'Otp Sended']);

        } catch (Throwable $e) {

            return response()->json(['errors' => ['status' => 'error', 'message' => $e->getMessage()]], 400);
        }

    }

    public function saveOtp($phone, $code, $type = 1)
    {
        $otp           = new OTP;
        $otp->mobile   = $phone;
        $otp->code     = $code;
        $otp->otp_type = $type;
        $otp->save();
    }

}
