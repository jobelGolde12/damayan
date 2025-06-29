<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ContributionControllerForCollector extends Controller
{
    public function index()
    {
         $mem = memberModel::with('contributions')->get();
        return Inertia::render('collector/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => 'all',
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
        return Inertia::render('collector/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => $selectedPurok,
        ]);
    }
}
