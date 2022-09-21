<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNilamBidsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nilam_bids', function (Blueprint $table) {
            $table->id();
            $table->foreignId('nilam_id');
            $table->foreignId('nilam_user_id')->comment('id who post the nilam');
            $table->foreignId('user_id')->comment('id who bid into nilam');
            $table->double('bid_price');
            $table->mediumText('proposal')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('disversed_status')->default(0);
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
        Schema::dropIfExists('nilam_bids');
    }
}
