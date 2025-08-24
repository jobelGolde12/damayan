<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\memberModel;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ContributionControllerForCollector extends Controller
{
    public function index()
    {
         $mem = memberModel::with('contributions')->get();
         $collectors = User::select('id', 'name', 'purok')
        ->where('role', 'collector')
        ->get();
        $paidMembersId = ContributionModel::pluck('member_id')->toArray();
        return Inertia::render('collector/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => 'all',
            'collectors' => $collectors,
            'paidMembersId' => $paidMembersId,
        ]);
    }

  public function toggleContributionPurok($purok){
        $mem = memberModel::whereHas('contributions', function ($query) use ($purok){
            $query->where('purok', $purok);
        })->with('contributions')->get();

        if($mem->empty()){
            if($purok == 'all'){
                $mem = memberModel::with('contributions')->get();
            }
        }
        $selectedPurok = $purok;
        $paidMembersId = ContributionModel::pluck('member_id')->toArray();
        return Inertia::render('collector/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => $selectedPurok,
            'paidMembersId' => $paidMembersId,
        ]);
    }
}
