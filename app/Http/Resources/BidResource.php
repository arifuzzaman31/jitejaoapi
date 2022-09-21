<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BidResource extends JsonResource
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
            'id'                  => $this->id,
            'user_id'             => $this->user_id,
            'demander_id'         => $this->demander_id,
            'user'                => new UserResource($this->whenLoaded('user')),
            'demander'            => new UserResource($this->whenLoaded('demander')),
            'demand'              => new DemandResource($this->whenLoaded('demand')),
            'bid_rating'          => $this->whenLoaded('bid_rating'),
            'proposal'            => strip_tags($this->proposal_description),
            'delivery_date'       => $this->work_due_date,
            'delivery_date_text'  => $this->work_due_date ? date('j M Y', strtotime($this->work_due_date)) : 'N/A',
            'bid_date'            => $this->bid_date,
            'bid_date_text'       => $this->bid_date ? date('j M Y', strtotime($this->bid_date)) : 'N/A',
            'bid_image_big'       => $this->bid_image ? fileBaseUrl() . '/bid/big/' . $this->bid_image : null,
            'bid_image_small'     => $this->bid_image ? fileBaseUrl() . '/bid/small/' . $this->bid_image : null,
            'offer_amount'        => $this->offer_amount,
            'confirmed_amount'    => $this->confirmed_amount,
            'is_shortlisted'      => $this->is_shortlisted == 0 ? false : true,
            'is_confirmed'        => $this->is_confirmed == 0 ? false : true,
            'state_of_bid'        => stateOfTheBid($this),
            'is_done_from_seller' => $this->is_done_from_seller == 0 ? false : true,
            'is_done_from_buyer'  => $this->is_done_from_buyer == 0 ? false : true,
            'is_done'             => $this->is_done == 0 ? false : true,
            'is_seller_reviewed'  => $this->is_seller_reviewed == 0 ? false : true,
            'is_buyer_reviewed'   => $this->is_buyer_reviewed == 0 ? false : true,
            'status'              => $this->status,
            'created_at'          => $this->created_at->diffForHumans(),
            'confirmed_at'        => $this->confirmed_date ? date("j M Y h:i a", strtotime($this->confirmed_date)) : null,
            'done_at'             => $this->done_date ? date("j M Y h:i a", strtotime($this->done_date)) : null,
        ];
    }
}
