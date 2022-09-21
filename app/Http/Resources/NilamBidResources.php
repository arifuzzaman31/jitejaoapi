<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class NilamBidResources extends JsonResource
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
            'id'               => $this->id,
            'nilam_id'         => $this->nilam_id,
            'nilam'            => new NilamResource($this->whenLoaded('nilam')),
            'nilam_user_id'    => $this->nilam_user_id,
            'bider_id'         => $this->user_id,
            'bid_user'         => new UserResource($this->whenLoaded('bid_user')),
            'bid_price'        => $this->bid_price,
            // 'proposal'         => $this->category_id,
            'delivery_charge'  => $this->delivery_charge,
            'total_price'      => $this->bid_price + $this->delivery_charge,
            'disversed_status' => $this->disversed_status == 0 ? true : false,
            'is_winner'        => $this->disversed_status == 0 ? 'Winner' : '',
            // 'win_bid'           => new UserResource($this->whenLoaded('win_bid')),
            'status'           => $this->status == 1 ? 'Active' : 'Inactive',
            'note'             => $this->note,
            'created_at'       => $this->created_at->diffForHumans(),

        ];
    }
}
