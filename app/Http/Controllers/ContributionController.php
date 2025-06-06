<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ContributionController extends Controller
{
    public function index(){
        $contri = ContributionModel::with('memberContribution')->get();
        return Inertia::render('admin/dashboard/contribution/MemberContribution', [
            'contributions' => $contri
        ]);
    }

    public function add(){
        $members = memberModel::select('id', 'first_name', 'last_name', 'middle_name')->get();
        return Inertia::render('admin/dashboard/contribution/AddContribution', [
            'members' => $members
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
