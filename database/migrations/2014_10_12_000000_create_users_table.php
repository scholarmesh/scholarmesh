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
        // Schema::dropDatabaseIfExists('scholarmesh');
        // Schema::createDatabase('scholarmesh');
        Schema::dropIfExists('user');
        Schema::create('user', function (Blueprint $table) {
            $table->increments('user_id');
            $table->string('email')->unique();
            $table->string('password', 64);
            $table->unsignedTinyInteger('type');
            $table->string('first_name', 45);
            $table->string('last_name', 45);
            $table->binary('dp')->nullable();
            $table->date('dob')->nullable();
            $table->string('phone', 13)->nullable();
            $table->json('address')->nullable();
            $table->tinyText('bio')->nullable();
            $table->timestamps();
            $table->rememberToken();
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
