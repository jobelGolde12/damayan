<?php

namespace App\Http\Controllers;

use App\Models\CollectorModel;
use App\Models\ContributionModel;
use App\Models\memberModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ContributionController extends Controller
{
    public function index(){
        $mem = memberModel::with('contributions')->get();
        $selectedPurok = 'all';
        return Inertia::render('admin/dashboard/contribution/MemberContribution', [
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
        return Inertia::render('admin/dashboard/contribution/MemberContribution', [
            'member' => $mem,
            'selectedPurok' => $selectedPurok,
        ]);
    }

    public function add(){
        $members = memberModel::select('id', 'first_name', 'last_name', 'middle_name')->get();
        $collectors = User::where('role', 'collector')->select('id', 'name')->get();
        return Inertia::render('admin/dashboard/contribution/AddContribution', [
            'members' => $members,
            'collectors' => $collectors,
        ]);
    }

     public function store(Request $request)
{
    $request->validate([
        'member_id' => 'required|exists:members,id',
        'amount' => 'required|numeric|min:0',
        'payment_date' => 'required|date',
        'collector' => 'required|string|max:255',
        'purok' => 'required',
        'status' => 'required',
    ]);
    ContributionModel::create([
        'member_id' => $request->member_id,
        'amount' => $request->amount,
        'payment_date' => $request->payment_date,
        'updated_by' => Auth::id(),
        'collector' => $request->collector,
        'purok' => $request->purok,
        'status' => $request->status,
    ]); 

    return redirect()->back()->with('success', 'Contribution created successfully.');
}
}
