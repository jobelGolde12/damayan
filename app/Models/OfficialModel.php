<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OfficialModel extends Model
{
    protected $table = 'officials';
    protected $fillable = [
        'name',
        'position',
        'term_start',
        'term_end',
        'status'
    ];
}
