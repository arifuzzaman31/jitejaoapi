<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUserBidStatusInNilamBids extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('nilam_bids', function (Blueprint $table) {
            $table->tinyInteger('user_bid_status')->default(1)->comment('1 = active in nilam , 0 = inactive');
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
