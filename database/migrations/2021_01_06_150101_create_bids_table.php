<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBidsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bids', function (Blueprint $table) {
            $table->id();
            $table->foreignId('demand_id');
            $table->foreignId('user_id')->comment('bidder id');
            $table->foreignId('demander_id')->comment('id for demander');
            $table->text('proposal_description')->nullable()->comment('description of proposel');
            $table->text('work_link')->nullable()->comment('if proposal having any link');
            $table->string('file')->nullable()->comment('if prosposal have any file');
            $table->string('work_due_date')->nullable()->comment('bid delivery date');
            $table->string('bid_date')->nullable()->comment('bid date');
            $table->string('confirmed_date')->nullable()->comment('date when bid confirmed date');
            $table->string('done_date')->nullable()->comment('date when bid done');
            $table->string('bid_image')->nullable()->comment('bid image');
            $table->tinyInteger('offer_amount_type')->default(1)->nullable()->comment('0 = negatiable , 1 = having budget');
            $table->double('offer_amount')->default(0)->nullable()->comment('0 = negatiable , 1 = having budget');
            $table->double('confirmed_amount')->default(0)->nullable()->comment('0 = negatiable , 1 = having budget');
            $table->tinyInteger('is_shortlisted')->default(0)->nullable()->comment('0 = not shortlisted , 1 = short_listed');
            $table->tinyInteger('is_confirmed')->default(0)->nullable()->comment('0 = not confirmed , 1 = confirmed');
            $table->tinyInteger('is_done_from_seller')->default(0)->nullable()->comment('0 = not done , 1 = done');
            $table->tinyInteger('is_done_from_buyer')->default(0)->nullable()->comment('0 = not done , 1 = done');
            $table->tinyInteger('is_done')->default(0)->nullable()->comment('0 = not done , 1 = done');
            $table->tinyInteger('is_seller_reviewed')->default(0)->nullable()->comment('0 = not  , 1 = done');
            $table->tinyInteger('is_buyer_reviewed')->default(0)->nullable()->comment('0 = not , 1 = done');
            $table->tinyInteger('status')->default(0)->nullable()->comment('0 = not active , 1 = active');
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
        Schema::dropIfExists('bids');
    }
}
