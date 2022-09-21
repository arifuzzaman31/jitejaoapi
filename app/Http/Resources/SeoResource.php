<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SeoResource extends JsonResource
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
            'id'           => $this->id,
            'site_name'    => $this->site_name,
            'title'        => $this->title,
            'meta_image'   => $this->meta_image ? fileBaseUrl() . '/seo/' . $this->meta_image : null,
            'sitemap_link' => $this->sitemap_link,
            'keyword'      => $this->keyword,
            'author'       => $this->author,
            'description'  => $this->description,

        ];
    }
}
