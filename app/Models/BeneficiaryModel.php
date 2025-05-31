<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BeneficiaryModel extends Model
{
    protected $table = 'beneficiary';
    protected $fillable = [
        'user_id',
        'name',
        'relation',
        'age',
        'birth_date'
    ];
}
