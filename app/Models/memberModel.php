<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class memberModel extends Model
{
    protected $table = 'members';
    protected $fillable = [
        'first_name',
        'last_name',
        'address',
        'contact_number',
        'date_of_birth',
        'registration_date',
        'purok',
        'age',
        'middle_name',
        'status',
        'occupation'
    ];
    public function beneficiaries()
{
    return $this->hasMany(BeneficiaryModel::class, 'user_id');
}
}
