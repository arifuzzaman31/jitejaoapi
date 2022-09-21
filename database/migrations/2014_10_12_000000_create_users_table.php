<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id()->from(1000);
            $table->string('name');
            $table->string('avatar')->nullable()->default('');
            $table->string('mobile_no')->unique();
            $table->string('email')->nullable()->unique();
            $table->foreignId('area_id')->nullable()->default(0);
            $table->foreignId('sub_area_id')->nullable()->default(0);
            $table->float('average_saling_rating')->default(0)->default(0);
            $table->float('average_buying_rating')->default(0)->default(0);
            $table->tinyInteger('seller_badge')->default(0)->comment('0 = no batch , 1 = silver , 2 = blue , 3 = pink');
            $table->tinyInteger('buyer_badge')->default(0)->comment('0 = no batch , 1 = silver , 2 = blue , 3 = pink');
            $table->boolean('is_seller')->default(0)->comment('0 = no , 1 = yes');
            $table->boolean('is_seller_before')->default(0)->comment('0 = no , 1 = yes');
            $table->boolean('post_permission')->default(1)->comment('0 = no , 1 = yes');
            $table->boolean('bid_permission')->default(1)->comment('0 = no , 1 = yes');
            $table->string('subscription_expired_at')->nullable()->default('');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->double('current_point')->default(0);
            $table->tinyInteger('status')->default(1)->comment('0 = inactive , 1 = active');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
