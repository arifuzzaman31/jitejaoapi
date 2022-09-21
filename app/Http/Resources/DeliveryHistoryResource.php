<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DeliveryHistoryResource extends JsonResource
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
            'id' => $this->id,
            'nilam_id' => $this->nilam_id,
            'bid_id' => $this->bid_id,
            'date' => date('j M Y', strtotime($this->date)),
            'comment' => $this->comment,
            'admin' => $this->whenLoaded('admin'),
            'delivery_status' => $this->delivery_status,
            'delivery_status_text' => DeliveryStatus($this->delivery_status),
            'created_at' => $this->created_at->diffForHumans(),
        ];
    }
}
