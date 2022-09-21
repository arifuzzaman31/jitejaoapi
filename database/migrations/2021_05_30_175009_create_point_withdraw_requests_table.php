<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePointWithdrawRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('point_withdraw_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('admin_id')->nullable()->comment('user requested amount paid by admin');
            $table->double('request_amount');
            $table->string('card_type')->nullable()->comment('online payment card type');
            $table->text('note')->nullable()->comment('withdraw description');
            $table->text('payment_method')->nullable()->comment('payment method');
            $table->dateTime('request_date')->comment('user request datetime');
            $table->dateTime('return_date')->nullable()->comment('requested amount paid datetime');
            $table->tinyInteger('status')->default(0)->comment('1 for payment done according to request, 0 for pending');
            
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
        Schema::dropIfExists('point_withdraw_requests');
    }
}
