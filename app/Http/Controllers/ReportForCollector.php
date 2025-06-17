<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ReportForCollector extends Controller
{
    public function index()
    {
        $contributions = ContributionModel::where([
            ['status', 'paid'],
            ['purok', 'purok1']
        ])
            ->with(['memberContribution' => function ($query) {
                $query->select('id', 'first_name','middle_name', 'last_name', 'purok', 'contact_number');
            }])
            ->latest('created_at')
            ->get();
        //Bilang san intero na members
        $membersCount = memberModel::count();
        return Inertia::render('collector/report/Index', [
            'contributions' => $contributions,
            'activePurok' => 'purok1',
            'membersCount' => $membersCount,
            'activeStatus' => 'paid', // default status muna
        ]);
    }

    public function toggleStatus($status, $purok) // In call lang ang purok para ma return sa frontend
    {
        // same logic san index method, pero dd in filter ang status
        $contributions = ContributionModel::where([
            ['status', $status],
            ['purok', 'purok1']
        ])
            ->with(['memberContribution' => function ($query) {
                $query->select('id', 'first_name','middle_name', 'last_name', 'purok', 'contact_number');
            }])
            ->latest('created_at')
            ->get();
        //Bilang san intero na members
        $membersCount = memberModel::count();
        return Inertia::render('collector/report/Index', [
            'contributions' => $contributions,
            'activePurok' => $purok,
            'membersCount' => $membersCount,
            'activeStatus' => $status, // update active status
        ]);
    }
    public function togglePurok($status, $purok)
    {
        // same logic padin sa nauna pero purok na ang in ta toggle o filter
        //pero kukuhaon padin ang default status
        $contributions = ContributionModel::where([
            ['status', $status],
            ['purok', $purok]
        ])
            ->with(['memberContribution' => function ($query) {
                $query->select('id', 'first_name','middle_name', 'last_name', 'purok', 'contact_number');
            }])
            ->latest('created_at')
            ->get();
        //Bilang san intero na members
        $membersCount = memberModel::count();
        return Inertia::render('collector/report/Index', [
            'contributions' => $contributions,
            'activePurok' => $purok,
            'membersCount' => $membersCount,
            'activeStatus' => $status, // update active status
        ]);
    }
}
