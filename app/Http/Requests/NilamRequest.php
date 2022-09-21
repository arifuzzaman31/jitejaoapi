<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NilamRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'category'      => 'required',
            'title'         => 'required',
            'quantity'      => 'required',
            'quantity_unit' => 'required',
            'expire_date'   => 'required',
            'expire_time'   => 'required',
            'image'         => 'nullable|mimes:jpeg,png,PNG,gif,jpg,webp,bmp',
            // 'image_two_name' => 'nullable|mimes:jpeg,png,PNG,gif,jpg,webp,bmp',
            // 'image_three_name' => 'nullable|mimes:jpeg,png,PNG,gif,jpg,webp,bmp',
        ];
    }

    public function messages()
    {
        return [
            'category.required'      => 'ক্যাটাগরি সিলেক্ট করুন',
            'title.required'         => 'শিরোনাম / টাইটেল দিন',
            'quantity.required'      => 'পরিমাণ দিন',
            'quantity_unit.required' => 'পরিমাণের ধরণ সিলেক্ট করুন',
            'expire_date.required'   => 'সেলার বিড এর শেষ তারিখ উল্লেখ করুন ',
            'image'                  => 'প্রথম ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
            // 'image_two_name'          => 'দ্বিতীয় ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
            // 'image_three_name'        => 'তৃতীয় ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
        ];
    }
}
