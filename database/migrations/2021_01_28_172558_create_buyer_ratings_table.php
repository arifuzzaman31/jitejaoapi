<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBuyerRatingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buyer_ratings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('bid_id');
            $table->foreignId('demand_id');
            $table->foreignId('reviewer_id')->comment('both user id on user');
            $table->foreignId('buyer_id')->comment('user id on user');
            $table->double('ratings')->default(0);
            $table->text('review')->nullable();
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
        Schema::dropIfExists('buyer_ratings');
    }
}
