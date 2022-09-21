<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id()->from(10000);
            $table->foreignId('user_id');
            $table->tinyInteger('time_type')->nullable()->default(1)->comment('1 = monthly , 2 = daily , 3 = yearly');
            $table->integer('total_month');
            $table->double('amount_per_month');
            $table->double('total_amount');
            $table->double('discount_for_month')->nullable()->default(0);
            $table->double('coupon_discount')->nullable()->default(0);
            $table->double('total_discount')->nullable()->default(0);
            $table->foreignId('coupon_id')->nullable()->default(0);
            $table->foreignId('subscription_plan_id')->nullable()->default(0);
            $table->string('coupon_code')->nullable()->default(0);
            $table->double('final_amount');
            $table->double('ssl_store_amount')->nullable()->default(0);
            $table->tinyInteger('payment_mode')->default(1)->comment('1 = online , 2 = offline');
            $table->foreignId('admin_id')->nullable()->default(1)->comment('admin who confirmed the payment if offline');
            $table->string('sessionkey')->nullable()->comment('session key for payment verification');
            $table->string('offline_payment_method')->nullable()->comment('bkash,bank,cash etc');
            $table->string('card_type')->nullable()->comment('online payment card type');
            $table->string('card_no')->nullable()->comment('online payment card no , for bakash it will be reference');
            $table->string('bank_transection_id')->nullable()->comment('online payment card no , for bakash it will be reference');
            $table->string('validation_id')->nullable()->comment('payment validation id');
            $table->string('date')->nullable()->comment('date of payment ');
            $table->string('transection_date_time')->nullable()->comment('time and date of transection');
            $table->string('transection_done_date_time')->nullable()->comment('time and date of transection done');
            $table->string('extend_from_date')->nullable()->comment('date extend started from');
            $table->string('extend_to_date')->nullable()->comment('date extend end  to');
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
        Schema::dropIfExists('payments');
    }
}
