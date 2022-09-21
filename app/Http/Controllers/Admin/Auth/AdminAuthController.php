<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use App\Models\Admin\Admin;
use Hash,Session,DB,Image;

class AdminAuthController extends Controller
{
    //
    public function index()
    {
      return view('admin.admin.admin_list');
    }

    public function getAdminData(Request $request)
    {
        return Admin::with('role')->get();
    }

    public function store(Request $request)
    {
        $request->validate([
          'name' => 'required',
          'email' => 'required|email|unique:admins',
          'password' => 'required|confirmed'
        ]);
        try {
          $admin = new Admin();
          
          $image_extension = 'jpeg';
            $profile_image = $request->input('image');

            $image_height = 128;

            if ($profile_image) {
                $imageName  = 'profile_' . time() . '.' . $image_extension;
                $image_file = \Image::make($profile_image)->resize(null, $image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('admin/' . $imageName, $image_file);

                $admin->avatar = $imageName;
            }

          $admin->name = $request->name;
          $admin->email = $request->email;
          $admin->role_id = $request->role;
          $admin->password = Hash::make($request->password);
          $admin->status = $request->status;
          $admin->save();
          return response()->json(['status' => 'success', 'message' => 'New Admin Created!']);
        } catch (\Throwable $th) {
            return $th;
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    public function update(Request $request)
    {
      $request->validate([
          'name' => 'required',
          'email' => 'required|unique:admins,email,'.$request->id,
        ]);
        try {
          $admin =  Admin::findOrFail($request->id);
          $profile_image = $request->image;
          if($profile_image)
          {
            if (file_exists('admin/'.$admin->avatar) && $admin->avatar != null) {
                \Storage::disk(currentFileSystem())->delete('admin/' . $admin->avatar);
            }

            $image_extension = 'jpeg';

            $image_height = 128;

            if ($profile_image) {
                $imageName  = 'profile_' . time() . '.' . $image_extension;
                $image_file = \Image::make($profile_image)->resize(null, $image_height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->encode($image_extension, 100);
                Storage::disk(currentFileSystem())->put('admin/' . $imageName, $image_file);

              $admin->avatar = $imageName;
            }
          }
          $admin->name = $request->name;
          $admin->email = $request->email;
          $admin->role_id = $request->role_id;
          $admin->status = $request->status;
          $admin->update();
          return response()->json(['status' => 'success', 'message' => 'Admin Updated!']);
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json(['status' => 'error', 'message' => $th->getMessage()]);
        }
    }

    public function adminLoginPage()
    {
        if(Auth::guard('admin')->check())
        {
            return redirect()->route('admin.dashboard');
        }
        return view('admin.auth.login');
    }

    
    // login company or company user in database 

    public function login(Request $request)
    {
      // return $request->all();
      $request->validate([
        'email' => 'required|email',
        'password' => 'required'
      ]);

      try{
        if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password,'status' => 1], $request->remember_me)) 
        {
            return redirect()->route('admin.dashboard');
        }
        else
        {
            return redirect()->back()->withInput()->with('message', 'Credential is wrong!');
        }
      }
      catch(\Throwable $e)
      {
        return response()->json(['status' => 'error','message' => $e->getMessage()]);
      }


    } 

    // login out admin  

    public function getChangePasswordPage()
    {
      return view('admin.auth.change_password');
    }

    public function storeChangePassword(Request $request)
    {
        $request->validate([
            'oldpassword' => 'required',
            'password'    => 'required|confirmed|min:6',
        ]);

        $hashPassword = Auth::guard('admin')->user()->password;

        if (Hash::check($request->oldpassword, $hashPassword)) {
            $admin           = Admin::find(Auth::guard('admin')->user()->id);
            $admin->password = Hash::make($request->password);
            $admin->save();
            Auth::logout();
            Session::flash('success', 'Password Changed Successfully!');
            return redirect()->route('login');
        } else {
          // return "no way";
            Session::flash('error', 'Current Password is Invalid!');
            return redirect()->back();
        }
    }

    // login out admin  

    public function logout()
    {
      Auth::guard('admin')->logout();

      return redirect()->route('admin.login');

    }

    public function destroy(Admin $admin)
    {
      
      if (file_exists('admin/'.$admin->avatar) && $admin->avatar != null) {
          \Storage::disk(currentFileSystem())->delete('admin/' . $admin->avatar);
      }
      
      if($admin->delete()){
          return response()->json(['status' => 'success', 'message' => 'Admin Deleted Successfully!']);
      }else{
          return response()->json(['status' => 'error', 'message' => 'something went wrong!']);
      };
    }

}
