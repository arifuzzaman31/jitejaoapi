<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDeliveryChargeToNilamBidsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('nilam_bids', function (Blueprint $table) {
            $table->double('delivery_charge')->nullable();
            $table->tinyInteger('is_pickup')->default(0);
            $table->tinyInteger('is_return')->default(0);
            $table->foreignId('admin_id')->default(0);
            $table->dateTime('payment_date')->nullable()->comment('buyer payment date');
            $table->tinyInteger('payment_status')->default(0)->comment('buyer payment status');
            $table->text('note')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('nilam_bids', function (Blueprint $table) {
            //
        });
    }
}
