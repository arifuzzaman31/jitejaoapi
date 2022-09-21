<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSmsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sms', function (Blueprint $table) {
            $table->id();
            $table->string('provider_name')->nullable();
            $table->string('api_key')->nullable();
            $table->string('api_secret')->nullable();
            $table->tinyInteger('new_bid_sms')->default(1)->comment('1 = active , 0 = inactive');
            $table->tinyInteger('confirm_bid_sms')->default(1)->comment('1 = active , 0 = inactive');
            $table->tinyInteger('demand_sms_location_status')->default(0)->comment('1 for location wise,0 to all');
            $table->tinyInteger('demand_sms_status')->default(1)->comment('1 = active , 0 = inactive');
            $table->tinyInteger('service_status')->default(1)->comment('1 = active , 0 = inactive, provider on either off');
            $table->tinyInteger('status')->default(1)->comment('1 = active , 0 = inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sms');
    }
}
