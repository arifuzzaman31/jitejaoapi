<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\Helpers\AllStatic;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\Api\V1\Auth\OTP;
use App\Models\User;
use App\Models\UserCategory;
use App\Models\User\UserInformation;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Throwable;

class LoginController extends Controller
{

    public function login(Request $request)
    {
        $request->validate(
            [
                'mobile_no' => 'required|size:11|regex:/(01)[0-9]{9}/',
                'otp_code'  => 'required|size:4',
            ]
            ,
            [
                'mobile_no.required' => 'মোবাইল নাম্বার দিন',
                'mobile_no.size'     => 'মোবাইল নাম্বার ১১ ডিজিট হতে হবে',
                'mobile_no.regex'    => 'ভুল মোবাইল  নাম্বার দিয়েছেন',
                'otp_code.required'  => 'ওটিপি দিন',
                'otp_code.size'      => 'ওটিপি ৪ ডিজিট এর দিন',
            ]
        );
        try
        {
            $current_time = date('Y-m-d H:i:s');
            $otp          = OTP::where('mobile', $request->mobile_no)
                ->where('code', $request->otp_code)
                ->first();
            if ($otp) {
                $expired_time = date('Y-m-d H:i:s', strtotime($otp->created_at . "+3 minutes"));
                if ($current_time <= $expired_time) {
                    // logged in user
                    $user = User::where('mobile_no', '=', $request->mobile_no)->first();
                    if ($user->status == AllStatic::$inactive) {
                        return response()->json(['status' => 'error', 'message' => 'Your account  is disabled please contact with admin'], 400);
                    }
                    // delete otp code
                    OTP::where('mobile', $request->mobile_no)
                        ->delete();
                    $token = $user->createToken('AuthToken')->accessToken;

                    return response()->json(['status' => 'success', 'token' => $token, 'user' => new UserResource($user)], 200);

                } else {
                    return response()->json(['status' => 'error', 'message' => 'OTP expired!'], 400);
                }

            } else {
                return response()->json(['status' => 'error', 'message' => 'Invalid OTP!'], 400);
            }
        } catch (Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th], 400);
            // return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }

    }

    public function register(Request $request)
    {
        // return $request->all();

        $request->validate(
            [
                'name'      => 'required',
                'area'      => 'required',
                'mobile_no' => 'required|size:11|regex:/(01)[0-9]{9}/|unique:users,mobile_no',
                'email'     => 'nullable|email|unique:users,email',
                'otp_code'  => 'required|size:4',
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
                'otp_code.required'    => 'ওটিপি দিন',
                'otp_code.size'        => 'ওটিপি ৪ ডিজিট এর দিন',
                'category.required_if' => 'ক্যাটাগরি সিলেক্ট করুন',
                'category.min'         => 'ক্যাটাগরি সিলেক্ট করুন',
            ]
        );

        try
        {
            $current_time = date('Y-m-d H:i:s');
            $otp          = OTP::where('mobile', $request->mobile_no)
                ->where('code', $request->otp_code)
                ->first();
            if ($otp) {
                $expired_time = new DateTime($otp->created_at);
                $expired_time->modify('+30 minutes');
                if ($current_time <= $expired_time) {
                    DB::beginTransaction();
                    // register  user
                    // return $request->area['id'];
                    $user            = new User;
                    $user->name      = $request->name;
                    $user->email     = $request->email;
                    $user->area_id   = $request->area['id'];
                    $user->mobile_no = $request->mobile_no;
                    // if ($request->is_seller) {
                    //     $user->subscription_expired_at = date('Y-m-d', strtotime('+7 days'));
                    //     $user->is_seller_before        = 1;
                    // }
                    $user->is_seller = 1;
                    // $user->is_seller = $request->is_seller ? 1 : 0;
                    if($request->app_to == 1){
                        $user->subscription_expired_at = date('Y-m-d', strtotime('+30 days'));
                        $user->current_point = 50; //for sometimes, must remove in production time
                    }else{
                        $user->subscription_expired_at = date('Y-m-d', strtotime('+30 days'));
                        $user->current_point = 20;
                    }

                    $user->save();

                    $user_info          = new UserInformation();
                    $user_info->user_id = $user->id;
                    $user_info->bio     = $request->bio;
                    $user_info->address = $request->address;
                    $user_info->save();
                    // if ($user->is_seller) {
                    //     foreach ($request->category as $value) {
                    //         $user_category              = new UserCategory;
                    //         $user_category->category_id = $value['id'];
                    //         $user_category->user_id     = $user->id;
                    //         $user_category->save();
                    //     }
                    // }
                    // delete otp code
                    OTP::where('mobile', $request->mobile_no)
                        ->delete();
                    $token = $user->createToken('AuthToken')->accessToken;

                    DB::commit();
                    return response()->json(['status' => 'success', 'token' => $token, 'user' => new UserResource($user)], 200);

                } else {
                    return response()->json(['status' => 'error', 'message' => 'OTP expired!'], 400);
                }

            } else {
                DB::rollBack();
                return response()->json(['status' => 'error', 'message' => 'Invalid OTP!'], 400);
            }
        } catch (\Throwable $th) {
            // return $th->getMessage();
            return response()->json(['status' => 'error', 'message' => $th->getMessage()], 400);
        }
    }

    public function getUser()
    {
        return response()->json(['status' => 'success', 'user' => new UserResource(request()->user())], 200);
    }

    public function update(Request $request)
    {
        // return 'dfghfg';
        // return response()->json($request->all());
        $id = request()->user()->id;
        $request->validate(
            [
                'name'      => 'required',
                'area'      => 'required',
                'mobile_no' => 'required|size:11|unique:users,mobile_no,' . $id,
                'email'     => 'nullable|email|unique:users,email,' . $id,
            ],
            [
                'name.required'      => 'আপনার নাম দিন',
                'area.required'      => 'লোকেশন সিলেক্ট করুন',
                'mobile_no.required' => 'মোবাইল নাম্বার দিন',
                'mobile_no.size'     => 'মোবাইল নাম্বার ১১ ডিজিট হতে হবে',
                'mobile_no.regex'    => 'ভুল মোবাইল  নাম্বার দিয়েছেন',
                'mobile_no.unique'   => 'এই নাম্বারে অলরেডি  অ্যাকাউন্ট রয়েছে',
                'email.unique'       => 'এই ইমেল অন্য একাউন্ট  এ রয়েছে',
            ]
        );

        try {

            $user       = User::find($id);
            $user->name = $request->name;

            $image_extension = 'jpeg';
            $picture         = $request->get('avatar');
            $image_height    = 100;

            if ($picture) {
                if ($user->avatar != null) {
                    $exist = \Storage::disk(currentFileSystem())->exists('avatar/' . $user->avatar);
                    if ($exist) {
                        \Storage::disk(currentFileSystem())->delete('avatar/' . $user->avatar);
                    }
                }

                $imageName         = $id . '_photo_' . uniqid() . '.' . $image_extension;
                $picture_main_file = Image::make($picture)->resize(null, $image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);

                Storage::disk(currentFileSystem())->put('avatar/' . $imageName, $picture_main_file);

                $user->avatar = $imageName;

            }

            $user->mobile_no   = $request->mobile_no;
            $user->email       = $request->email;
            $user->area_id     = $request->area;
            $user->sub_area_id = $request->sub_area_id;
            // if (($user->is_seller == 0) && ($request->is_seller == 1)) {
            //     $user->is_seller               = $request->is_seller;
            //     $dt                            = date("Y-m-d");
            //     $user->subscription_expired_at = date("Y-m-d", strtotime("$dt +7 days"));
            // } else {
            //     $user->is_seller = $request->is_seller;
            // }
            $user->is_seller = 1;
            $user->status = $request->status;
            $user->update();
            return response()->json(['status' => 'success', 'message' => 'Your Profile Updated Successfully !', 'user' => new UserResource($user)], 200);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'error', 'message' => $th], 400);
        }

    }

    public function logout(Request $request)
    {
        try
        {
            DB::beginTransaction();

            if ($request->logout_from_all_device == true) {
                $user = request()->user();
                DB::table('oauth_access_tokens')->where('user_id', '=', $user->id)->delete();
            }

            request()->user()->token()->revoke();
            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'logout success'], 200);
        } catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 403);
        }
    }
}
