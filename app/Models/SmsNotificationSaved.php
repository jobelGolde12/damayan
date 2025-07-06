<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SmsNotificationSaved extends Model
{
    protected $table = 'sms_notification_saved';
    protected $fillable = ['message', 'type'];
}
