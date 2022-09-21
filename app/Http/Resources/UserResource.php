<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'id'                           => $this->id,
            'name'                         => $this->name,
            'avatar'                       => $this->avatar ? fileBaseUrl() . '/avatar/' . $this->avatar : fileBaseUrl() . '/avatar/default/avatar.svg',
            'mobile_no'                    => $this->mobile_no,
            'email'                        => $this->email,
            'area_id'                      => $this->area_id,
            'area'                         => $this->whenLoaded('area'),
            'user_information'             => $this->whenLoaded('user_information'),
            'category'                     => $this->whenLoaded('category'),
            'average_selling_rating'       => $this->average_saling_rating,
            'average_buying_rating'        => $this->average_buying_rating,
            'seller_badge'                 => $this->seller_badge,
            'buyer_badge'                  => $this->buyer_badge,
            'seller_badge_title'           => $this->getSellerBadgeName($this->seller_badge),
            'buyer_badge_title'            => $this->getBuyerBadgeName($this->buyer_badge),
            'is_seller'                    => $this->is_seller == 0 ? false : true,
            'is_seller_before'             => $this->is_seller_before == 0 ? false : true,
            'post_permission'              => $this->post_permission == 0 ? false : true,
            'bid_permission'               => $this->bid_permission == 0 ? false : true,
            'subscription_expired_at'      => $this->subscription_expired_at,
            'subscription_expired_at_text' => date("j M Y", strtotime($this->subscription_expired_at)),
            'current_point'                => $this->current_point,
            'status'                       => $this->status,
            'joined_at'                    => date("j M Y h:i a", strtotime($this->created_at)),
        ];
    }

    public function getSellerBadgeName($seller_badge)
    {
        $badge = "";
        switch ($seller_badge) {
            case 1:
                $badge = 'Silver Badge';
                break;
            case 2:
                $badge = 'Blue Badge';
                break;
            case 3:
                $badge = 'Pink Badge';
                break;

            default:
                $badge = 'No Badge';
                break;
        }

        return $badge;

    }
    public function getBuyerBadgeName($buyer_badge)
    {
        $badge = "";
        switch ($buyer_badge) {
            case 1:
                $badge = 'Silver Badge';
                break;
            case 2:
                $badge = 'Blue Badge';
                break;
            case 3:
                $badge = 'Pink Badge';
                break;

            default:
                $badge = 'No Badge';
                break;
        }

        return $badge;

    }
}
