<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class NilamResource extends JsonResource
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
            'id'                    => $this->id,
            'user_id'               => $this->user_id,
            'user'                  => new UserResource($this->whenLoaded('user')),
            'win_bid'               => new NilamBidResources($this->whenLoaded('win_bid')),
            // 'some_nilam_bid'    => new NilamBidResources($this->whenLoaded('some_nilam_bid')),
            'title'                 => $this->title,
            'slug'                  => str_replace([' ', '/'], '-', str_replace('%', 'percent', $this->title)),
            'category_id'           => $this->category_id,
            'category'              => new CategoryResource($this->whenLoaded('category')),
            'image_one_small'       => $this->image_one ? fileBaseUrl() . '/demand/small/' . $this->image_one : null,
            'image_one_big'         => $this->image_one ? fileBaseUrl() . '/demand/big/' . $this->image_one : null,
            'image_two_small'       => $this->image_two ? fileBaseUrl() . '/demand/small/' . $this->image_two : null,
            'image_two_big'         => $this->image_two ? fileBaseUrl() . '/demand/big/' . $this->image_two : null,
            'image_three_small'     => $this->image_three ? fileBaseUrl() . '/demand/small/' . $this->image_three : null,
            'image_three_big'       => $this->image_three ? fileBaseUrl() . '/demand/big/' . $this->image_three : null,
            'default_big_image'     => $this->image_one ? null : fileBaseUrl() . '/demand/default/big.jpg',
            'default_mid_image'     => $this->image_one ? null : fileBaseUrl() . '/demand/default/mid.jpg',
            'description'           => $this->description,
            'app_description'       => strip_tags($this->description),
            'base_price'            => $this->base_price,
            'quantity'              => $this->quantity,
            'quantity_unit_id'      => $this->quantity_unit_id,
            'quantity_unit'         => $this->whenLoaded('quantity_unit'),
            'product_condition'     => $this->product_condition == 0 ? 'পূরাতন' : 'নতুন',
            'video_link'            => $this->video_link,
            'status'                => $this->status == 0 ? 'Inactive' : 'Active',
            'delivery_status'       => $this->delivery_status,
            'delivery_status_text'  => DeliveryStatus($this->delivery_status),
            'delivery_date'         => $this->delivery_date,
            'pickup_date'           => $this->pickup_date,
            'delivery_address'      => $this->delivery_address,
            'from_address'          => $this->from_address,
            'payment_status'        => $this->payment_status,
            'seller_payment_status' => $this->seller_payment_status,
            'buyer_payment_date'    => $this->buyer_payment_date,
            'seller_payment_date'   => $this->seller_payment_date,
            'seller_payment_note'   => $this->seller_payment_note,
            'payment_status_text'   => $this->payment_status == 0 ? 'Non-Paid' : 'Paid',
            'is_return'             => $this->is_return == 0 ? false : true,
            'is_pickup'             => $this->is_pickup,
            'pickup_date'           => $this->pickup_date,
            'payment_details'       => $this->payment_details,
            'expire_date'           => $this->expire_date,
            'is_expired'            => $this->expire_date < date('Y-m-d H:i:s') ? true : false,
            'will_expired_in'       => dayHourMinute($this->expire_date),
            // 'expire_date_human' => $this->expire_date->diffForHumans(),
            'created_at'            => $this->created_at->diffForHumans(),

        ];
    }
}
