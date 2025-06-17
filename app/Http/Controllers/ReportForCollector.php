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
        ]);
    }

    public function toggleStatus($status)
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
            'activePurok' => 'purok1',
            'membersCount' => $membersCount,
        ]);
    }
}
