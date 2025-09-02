<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\DeathReportModel;
use App\Models\memberModel;
use App\Models\SmsNotificationSaved;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SmsNotificationController extends Controller
{
    public function index(){
        $deathReport = DeathReportModel::latest()->first();
        $disbursed = ContributionModel::sum('amount'); 
        $members = memberModel::select('id', 'first_name', 'last_name')->get()->toArray();
        return Inertia::render('admin/smsNotification/Index', [
            'deathReport' => $deathReport,
            'disbursed' => $disbursed,
            'members' => $members,
        ]);
    }
    public function smsPage(){ //Pages/admin/SmsPage.vue
        
        $deathReport = SmsNotificationSaved::where('type', 'deathReport')->latest()->first();
        $scheduleContribution = SmsNotificationSaved::where('type', 'scheduleContribution')->latest()->first();
        $reminders = SmsNotificationSaved::where('type', 'reminders')->latest()->first();
        $fundUpdates = SmsNotificationSaved::where('type', 'fundUpdates')->latest()->first();

        return Inertia::render('admin/SmsPage', [
            'deathReport' => $deathReport,
            'scheduleContribution' => $scheduleContribution,
            'reminders' => $reminders,
            'fundUpdates' => $fundUpdates
        ]);
    }
    public function addDeathReport(Request $request){
         $request->validate([
        'deathReport' => 'nullable|string',
        'scheduleContribution' => 'nullable|string',
        'reminders' => 'nullable|string',
        'fundUpdates' => 'nullable|string',
        'type' => 'required|string',
        ]);

        if($request->type == 'deathReport'){
            SmsNotificationSaved::create([
                'message' => $request->deathReport,
                'type' => $request->type
            ]);
        }else if($request->type == 'scheduleContribution'){
            SmsNotificationSaved::create([
                'message' => $request->scheduleContribution,
                'type' => $request->type
            ]);
        }else if($request->type == 'reminders'){
            SmsNotificationSaved::create([
                'message' => $request->reminders,
                'type' => $request->type
            ]);
        }else if($request->type == 'fundUpdates'){
            SmsNotificationSaved::create([
                'message' => $request->fundUpdates,
                'type' => $request->type
            ]);
        }
        
    return redirect()->back()->with('success', 'Notification data saved.');
    }

    public function selectMembers(Request $request)
    {
        $type = $request->input('type');
        $message = $request->input('message');
        $members = $request->input('members');

        return Inertia::render('SelectMemberForSms', [
            'members' => $members,
            'message' => $message,
            'type' => $type
        ]);
    }
}
