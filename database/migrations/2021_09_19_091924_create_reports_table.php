<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reports', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('userID');
            $table->string('nama');
            $table->string('email');
            $table->integer('P');
            $table->integer('I');
            $table->integer('J');
            $table->integer('T');
            $table->integer('E');
            $table->integer('N');
            $table->integer('F');
            $table->integer('S');
            $table->char('result', 4);
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
        Schema::dropIfExists('reports');
    }
}
