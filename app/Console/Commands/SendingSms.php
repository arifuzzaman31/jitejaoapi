<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Sendsms;
use App\Models\Demand\Demand;
use Illuminate\Support\Facades\Log;
use App\Helpers\AllStatic;
use App\Sms\SendNotification;

class SendingSms extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    // protected $users;

    protected $signature = 'send:sms';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send SMS to user who belongs to the Category.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
       // send sms from job 
      
       new SendNotification();
    }
}
