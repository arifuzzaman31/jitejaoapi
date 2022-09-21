<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Models\User;
use App\Models\Bid\Bid;

class Notify implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    // public $user;
    public $bid;
    /**
     * Create a new event instance.
     *
     * @return void
     */

    public function __construct($bid)
    {
        // dd($bid->demander);
        $this->bid = $bid;
    }

    // public function __construct(array $bid)
    // {
    //     // $this->user = User::find($id);
    //     $this->bid = $bid;
    //    // $this->bid = Bid::where('user_id',$this->user_id)->get();
    // }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        // return ['new_bid_on_demand'];
        // return new PrivateChannel('newpost.'.$this->bid->user_id);
        return new PrivateChannel('new_bid_on_demand.'.$this->bid->demander_id);
    }
}
