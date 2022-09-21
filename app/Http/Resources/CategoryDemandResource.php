<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryDemandResource extends JsonResource
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
            'id'            => $this->id,
            'name'          => $this->name,
            'slug'          => str_replace([' ', '/'], '-', str_replace('%', 'percent', $this->name)),
            'english_name'  => $this->english_name,
            'icon'          => $this->icon ? fileBaseUrl() . '/category/' . $this->icon : null,
            'image'         => $this->image ? fileBaseUrl() . '/category/' . $this->image : null,
            'seo_image'     => $this->seo_image ? fileBaseUrl() . '/category/' . $this->seo_image : null,
            'banner'        => $this->banner ? fileBaseUrl() . '/category/' . $this->banner : null,
            'quantity_unit' => $this->whenLoaded('quantity_unit'),
            'latestDemand'  => DemandResource::collection($this->whenLoaded('demands')->take(4)),
            'status'        => $this->status,
        ];
    }
}
