<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\DeathReportModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SmsNotificationController extends Controller
{
    public function index(){
        $deathReport = DeathReportModel::latest()->first();
        $disbursed = ContributionModel::sum('amount'); 
        return Inertia::render('admin/smsNotification/Index', [
            'deathReport' => $deathReport,
            'disbursed' => $disbursed,
        ]);
    }
    public function smsPage(){
        return Inertia::render('admin/SmsPage');
    }
}
