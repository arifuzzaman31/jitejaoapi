<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->double('total_amount');
            $table->double('per_month_amount');
            $table->double('discount_type')->nullable();
            $table->double('discount_value')->nullable();
            $table->double('discount_amount')->nullable();
            $table->double('final_amount');
            $table->string('quantity');
            $table->string('payment_date');
            $table->string('payment_method')->nullable();
            $table->string('is_online_payment')->nullable();
            $table->foreignId('paid_by')->nullable();
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
        Schema::dropIfExists('subscriptions');
    }
}
