<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BuyerRatingResource extends JsonResource
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
            'id'          => $this->id,
            'demand_id'   => $this->demand_id,
            'bid_id'      => $this->bid_id,
            'reviewer_id' => $this->reviewer_id,
            'buyer_id'    => $this->buyer_id,
            'ratings'     => $this->ratings,
            'review'      => $this->review,
            'reviewer'    => new UserResource($this->whenLoaded('reviewer')),
            'buyer'       => new UserResource($this->whenLoaded('buyer')),
            'demand'      => new DemandResource($this->whenLoaded('demand')),
            'bid'         => new BidResource($this->whenLoaded('bid')),
            'created_at'  => $this->created_at,
            'updated_at'  => $this->updated_at,
            'reviewed_at'  => date("j M Y h:i a", strtotime($this->created_at)),
        ];
    }
}
