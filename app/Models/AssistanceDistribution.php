<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AssistanceDistribution extends Model
{
    use SoftDeletes;
    protected $table = 'assistance_distribution';
    protected $fillable = [
        'report_id',
        'total_amount',
        'distribution_date'
    ];
}
