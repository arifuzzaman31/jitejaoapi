<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendDemandSms implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public $users;

    public function __construct($user)
    {
        $this->users = $user;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // $users = \DB::table('users')->where('email','!=','')->get();
        foreach ($this->users as $user)
        { 
           \Mail::raw("You have opertunity to get the project.", function($message) use ($user)
           {
               $message->from('voot@gmail.com');
               $message->to($user->email)->subject('Send sms from Demand Apps.');
           });
        }
           // $this->info('Hourly Update has been send successfully');
    }
}
