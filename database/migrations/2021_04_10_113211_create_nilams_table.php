<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNilamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nilams', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('area_id');
            $table->foreignId('category_id');
            $table->string('title');
            $table->integer('quantity');
            $table->foreignId('quantity_unit_id');
            $table->string('image_one');
            $table->string('image_two')->nullable();
            $table->string('image_three')->nullable();
            $table->string('image_four')->nullable();
            $table->text('description')->nullable();
            $table->double('base_price');
            $table->dateTime('expire_date');
            $table->string('video_link')->nullable();
            $table->tinyInteger('product_condition')->comment('1= new , 0 = old');
            $table->tinyInteger('status')->default(1);
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
        Schema::dropIfExists('nilams');
    }
}
