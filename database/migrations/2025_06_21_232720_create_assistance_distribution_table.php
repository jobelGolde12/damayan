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
         Schema::create('assistance_distribution', function (Blueprint $table) {
            $table->id('distribution_id');
            $table->unsignedBigInteger('report_id');
            $table->decimal('total_amount', 10, 2);
            $table->dateTime('distribution_date');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('report_id')->references('report_id')->on('death_reports')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assistance_distribution');
    }
};
