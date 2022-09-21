<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePointsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('points', function (Blueprint $table) {
            $table->id()->from(10000);
            $table->foreignId('user_id');
            $table->tinyInteger('time_type')->nullable()->default(1)->comment('1 = monthly , 2 = daily , 3 = yearly');
            $table->double('total_points');
            $table->double('total_amount');
            $table->double('total_discount')->nullable()->default(0);
            $table->double('ssl_store_amount')->nullable()->default(0);
            $table->tinyInteger('payment_mode')->default(1)->comment('1 = online , 2 = offline');
            $table->foreignId('admin_id')->nullable()->default(1)->comment('admin who confirmed the payment if offline');
            $table->string('sessionkey')->nullable()->comment('session key for payment verification');
            $table->string('offline_payment_method')->nullable()->comment('bkash,bank,cash etc');
            $table->string('card_type')->nullable()->comment('online payment card type');
            $table->string('card_no')->nullable()->comment('online payment card no , for bakash it will be reference');
            $table->string('bank_transection_id')->nullable()->comment('online payment card no , for bakash it will be reference');
            $table->string('validation_id')->nullable()->comment('payment validation id');
            $table->date('date')->nullable()->comment('date of payment ');
            $table->dateTime('transection_date_time')->nullable()->comment('time and date of transection');
            $table->dateTime('transection_done_date_time')->nullable()->comment('time and date of transection done');
            $table->string('transection_status')->nullable()->comment('valid in valid or something like that');
            $table->tinyInteger('payment_status')->default(0)->nullable()->comment('0 = not paid , 1 = payment done');
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
        Schema::dropIfExists('points');
    }
}
