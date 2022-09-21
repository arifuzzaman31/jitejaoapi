<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDemandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demands', function (Blueprint $table) {
            $table->id()->from(1000);
            $table->foreignId('user_id')->comment('demander');
            $table->foreignId('category_id')->default(0)->nullable()->comment('category of demand or post');
            $table->foreignId('area_id')->default(0)->nullable()->comment('Area of demander');
            $table->string('title')->nullable()->comment('demand title');
            $table->longText('description')->nullable()->default('')->comment('demand description');
            $table->string('image_one')->nullable()->comment('image one');
            $table->string('image_two')->nullable()->comment('image two');
            $table->string('image_three')->nullable()->comment('image three');
            $table->double('quantity')->nullable()->comment('quantity of demanded product');
            $table->foreignId('quantity_unit_id')->default(0)->nullable()->comment('Quantity Unit Of the quantity');
            $table->tinyInteger('budget_type')->default(0)->nullable()->comment('1 = budget , 0 = negatiable');
            $table->double('minimum_budget')->default(0)->nullable()->comment('buget getting start from');
            $table->double('maximum_budget')->default(0)->nullable()->comment('Maximum Limit of budget');
            $table->double('fixed_budget')->default(0)->nullable()->comment('otional for now needed in future');
            $table->double('confirmed_amount')->default(0)->nullable()->comment('confirmed bid amount');
            $table->foreignId('confirmed_to')->default(0)->nullable()->comment('user_id which the bid confirmed');
            $table->string('expire_date')->default(0)->nullable()->comment('post will not appear after this expire_date');
            $table->integer('total_like')->default(0)->nullable()->comment('Like to post');
            $table->integer('total_bid')->default(0)->nullable()->comment('totl amount of bid');
            $table->tinyInteger('bid_status')->default(0)->nullable()->comment('0 = not confirmed , 1 = confirmed');
            $table->tinyInteger('is_done')->default(0)->nullable()->comment('0 = not done , 1 = done');
            $table->tinyInteger('status')->default(1)->nullable()->comment('1 = active , 0 = terminated');
            $table->tinyInteger('sms_status')->default(0)->nullable()->comment('1 = sended , 0 = not sended');
            $table->tinyInteger('notification_status')->default(0)->nullable()->comment('1 = sended , 0 = not sended');
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
        Schema::dropIfExists('demands');
    }
}
