<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAddressToNilamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('nilams', function (Blueprint $table) {
            $table->text('delivery_address')->nullable();
            $table->text('from_address')->nullable();
            $table->tinyInteger('delivery_status')->default(0);
            $table->tinyInteger('payment_status')->default(0)->comment('buyer payment status');
            $table->tinyInteger('seller_payment_status')->default(0);
            $table->dateTime('buyer_payment_date')->nullable();
            $table->dateTime('seller_payment_date')->nullable();
            $table->tinyInteger('is_pickup')->default(0);
            $table->dateTime('pickup_date')->nullable();
            $table->dateTime('delivery_date')->nullable();
            $table->tinyInteger('is_return')->default(0);
            $table->text('payment_details')->nullable();
            $table->text('seller_payment_note')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('nilams', function (Blueprint $table) {
            //
        });
    }
}
