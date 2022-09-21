<?php

namespace App\Http\Resources;

use App\Helpers\AllStatic;
use Illuminate\Http\Resources\Json\JsonResource;

class PaymentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                     => $this->id,
            'user_id'                => $this->user_id,
            'admin_id'               => $this->user_id,
            'user'                   => $this->whenLoaded('user'),
            'admin'                  => $this->whenLoaded('admin'),
            'total_month'            => $this->total_month,
            'amount_per_month'       => $this->amount_per_month,
            'total_amount'           => $this->total_amount,
            'discount_for_month'     => $this->discount_for_month,
            'coupon_discount'        => $this->coupon_discount,
            'total_discount'         => $this->total_discount,
            'coupon_id'              => $this->coupon_id,
            'coupon'                 => $this->whenLoaded('coupon'),
            'coupon_code'            => $this->coupon_code,
            'final_amount'           => $this->final_amount,
            'payment_mode'           => $this->payment_mode,
            'payment_mode_text'      => $this->payment_mode == 1 ? 'অনলাইন ' : 'অফলাইন ',
            'offline_payment_method' => $this->offline_payment_method,
            'card_type'              => $this->card_type,
            'card_no'                => $this->card_no,
            'bank_transection_id'    => $this->bank_transection_id,
            'validation_id'          => $this->validation_id,
            'payment_date'           => $this->date,
            'transection_date_time'  => $this->transection_date_time,
            'extend_from_date'       => $this->extend_from_date ? date("j M Y", strtotime($this->extend_from_date)) : null,
            'extend_to_date'         => $this->extend_to_date ? date("j M Y", strtotime($this->extend_to_date)) : null,
            'transection_status'     => $this->transection_status,
            'payment_status'         => $this->payment_status,
            'payment_status_text'    => $this->payment_status == AllStatic::$paid ? 'paid' : 'failed',
        ];
    }
}
