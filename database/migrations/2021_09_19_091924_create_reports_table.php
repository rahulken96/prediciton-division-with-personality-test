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
            $table->integer('I');
            $table->integer('E');
            $table->integer('N');
            $table->integer('S');
            $table->integer('T');
            $table->integer('F');
            $table->integer('J');
            $table->integer('P');
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
