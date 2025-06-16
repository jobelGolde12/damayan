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
         $mem = memberModel::whereHas('contributions', function ($query){
            $query->where('purok', 'purok1');
        })->with('contributions')->get();
        $selectedPurok = 'purok1';
        return Inertia::render('collector/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => $selectedPurok,
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
