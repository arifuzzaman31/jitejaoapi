<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWithdrawRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdraw_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('nilam_id');
            $table->foreignId('nilam_bid_id');
            $table->foreignId('user_id');
            $table->double('amount')->default(0)->nullable();
            $table->text('comment')->nullable()->comment('payment related comment');
            $table->dateTime('requested_at')->nullable()->comment('date time');
            $table->dateTime('payment_at')->nullable()->comment('date time');
            $table->tinyInteger('status')->default(0)->nullable()->comment('0 = not paid , 1 = paid , 2 = rejected');
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
        Schema::dropIfExists('withdraw_requests');
    }
}
