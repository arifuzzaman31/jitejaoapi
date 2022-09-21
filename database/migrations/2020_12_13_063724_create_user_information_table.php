<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInformationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_information', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string('address')->nullable();
            $table->text('bio')->nullable()->comment('biaography about person or company');
            $table->integer('total_post')->nullable()->default(0)->comment('total number of demand posted by user');
            $table->integer('total_bid')->nullable()->default(0)->comment('total amount bid user psot');
            $table->integer('total_completed_work')->nullable()->default(0)->comment('total bid confirmed or completed work');
            $table->integer('total_worker_hired')->nullable()->default(0)->comment('total worker hired by a buyer');
            $table->string('cover_image')->nullable()->default('');
            $table->double('total_amount_sales')->nullable()->default(0)->comment('total completed work amount');
            $table->double('total_amount_buying')->nullable()->default(0)->comment('total demand value');
            $table->integer('total_qty_buyed')->nullable()->default(0);
            $table->integer('total_qty_sold')->nullable()->default(0);
            $table->tinyInteger('status')->nullable()->default(0);
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
        Schema::dropIfExists('user_information');
    }
}
