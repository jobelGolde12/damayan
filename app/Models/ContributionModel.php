<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContributionModel extends Model
{
    protected $table = 'contributions';
    protected $fillable = [
        'member_id',
        'ammount',
        'payment_date',
        'updated_by',
    ];
}
