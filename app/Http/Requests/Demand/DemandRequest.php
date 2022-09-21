<?php

namespace App\Http\Requests\Demand;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class DemandRequest extends FormRequest
{
    /**
     *
     * Generating json response otherwise it will redirect back
     */
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json($validator->errors(), 422));
    }

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
            'category'       => 'required',
            'title'          => 'required',
            'quantity'       => 'required',
            'quantity_unit'  => 'required',
            'minimum_budget' => 'required_if:budget_type,true|nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
            'maximum_budget' => 'required_if:budget_type,true|nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/|gte:minimum_budget',
            'expire_date'    => 'required',
            // 'image_one' => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            // 'image_two' => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            // 'image_three' => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
        ];
    }

    public function messages()
    {
        return [
            'category.required'          => 'ক্যাটাগরি সিলেক্ট করুন',
            'title.required'             => 'শিরোনাম / টাইটেল দিন',
            'quantity.required'          => 'পরিমাণ দিন',
            'quantity_unit.required'     => 'পরিমাণের ধরণ সিলেক্ট করুন',
            'minimum_budget.required_if' => 'মিনিমাম বাজেট উল্লেখ করুন',
            'maximum_budget.required_if' => 'ম্যাক্সিমাম  বাজেট উল্লেখ করুন',
            'expire_date.required'       => 'সেলার বিড এর শেষ তারিখ উল্লেখ করুন ',
            'image_one.image64'          => 'প্রথম ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
            'image_two.image64'          => 'দ্বিতীয় ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
            'image_three.image64'        => 'তৃতীয় ফটোর  গ্রহণযোগ্য ফরমেট ঃ jpeg , png , webp, bmp , gif',
        ];
    }
}
