<?php

namespace App\Http\Resources;

use App\Helpers\AllStatic;
use Illuminate\Http\Resources\Json\JsonResource;

class PointResource extends JsonResource
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
            'total_points'           => $this->total_points,
            'total_amount'           => $this->total_amount,
            'ssl_amount'             => $this->ssl_store_amount,
            'total_discount'         => $this->total_discount,
            'payment_mode'           => $this->payment_mode,
            'payment_mode_text'      => $this->payment_mode == 1 ? 'অনলাইন ' : 'অফলাইন ',
            'offline_payment_method' => $this->offline_payment_method,
            'card_type'              => $this->card_type,
            'card_no'                => $this->card_no,
            'bank_transection_id'    => $this->bank_transection_id,
            'validation_id'          => $this->validation_id,
            'payment_date'           => $this->date,
            'transection_date_time'  => $this->transection_date_time,
            'transection_status'     => $this->transection_status,
            'payment_status'         => $this->payment_status,
            'payment_status_text'    => $this->payment_status == AllStatic::$paid ? 'paid' : 'failed',
        ];
    }
}
