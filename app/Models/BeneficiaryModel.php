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
    public function member()
{
    return $this->belongsTo(MemberModel::class, 'user_id');
}
}
