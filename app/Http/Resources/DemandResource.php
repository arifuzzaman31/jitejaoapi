<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DemandResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return fileBaseUrl();
        return [
            'id'                => $this->id,
            'user_id'           => $this->user_id,
            'area_id'           => $this->area_id,
            'slug'              => str_replace([' ', '/'], '-', str_replace('%', 'percent', $this->title)),
            'title'             => $this->title,
            'description'       => $this->description,
            'app_description'   => strip_tags($this->description),
            'user'              => new UserResource($this->whenLoaded('user')),
            'area'              => $this->whenLoaded('area'),
            'category_id'       => $this->category_id,
            'category'          => new CategoryResource($this->whenLoaded('category')),
            'bid'               => new BidResource($this->whenLoaded('bid')),
            'win_bid'           => new BidResource($this->whenLoaded('win_bid')),
            'demand_rating'     => $this->whenLoaded('demand_rating'),
            'image_one_small'   => $this->image_one ? fileBaseUrl() . '/demand/small/' . $this->image_one : fileBaseUrl() . '/demand/default/mid.jpg',
            'image_one_medium'  => $this->image_one ? fileBaseUrl() . '/demand/medium/' . $this->image_one : fileBaseUrl() . '/demand/default/mid.jpg',
            'image_one_big'     => $this->image_one ? fileBaseUrl() . '/demand/big/' . $this->image_one : fileBaseUrl() . '/demand/default/big.jpg',
            'image_two_small'   => $this->image_two ? fileBaseUrl() . '/demand/small/' . $this->image_two : null,
            'image_two_big'     => $this->image_two ? fileBaseUrl() . '/demand/big/' . $this->image_two : null,
            'image_three_small' => $this->image_three ? fileBaseUrl() . '/demand/small/' . $this->image_three : null,
            'image_three_big'   => $this->image_three ? fileBaseUrl() . '/demand/big/' . $this->image_three : null,
            'default_big_image' => $this->image_one ? null : fileBaseUrl() . '/demand/default/big.jpg',
            'default_mid_image' => $this->image_one ? null : fileBaseUrl() . '/demand/default/mid.jpg',
            'quantity'          => $this->quantity,
            'quantity_unit_id'  => $this->quantity_unit_id,
            'quantity_unit'     => $this->whenLoaded('quantity_unit'),
            'budget_type'       => $this->budget_type == 1 ? true : false,
            'minimum_budget'    => $this->minimum_budget,
            'maximum_budget'    => $this->maximum_budget,
            'confirmed_amount'  => $this->confirmed_amount,
            'expire_date'       => $this->expire_date,
            'expire_date_text'  => date('j M Y', strtotime($this->expire_date)),
            'total_like'        => $this->total_like,
            'total_bid'         => $this->total_bid,
            'bid_status'        => $this->bid_status == 0 ? false : true,
            'bid_status_text'   => $this->bid_status == 0 ? 'not confirmed' : 'confirmed',
            'is_done'           => $this->is_done == 0 ? false : true,
            'is_done_text'      => $this->is_done == 0 ? 'not done' : 'done',
            'status'            => $this->status,

        ];
    }
}
