<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('death_reports', function (Blueprint $table) {
            $table->id('report_id');
            $table->unsignedBigInteger('reported_by'); //id san namatay or id san nag report 
            $table->unsignedBigInteger('member_id');
            $table->string('deceased_name', 100);
            $table->date('date_of_death');
            $table->dateTime('report_date');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('reported_by')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('member_id')->references('id')->on('members')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('death_reports');
    }
};
