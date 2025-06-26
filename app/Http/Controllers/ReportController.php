<?php

namespace App\Http\Controllers;

use App\Models\ContributionModel;
use App\Models\memberModel;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ReportController extends Controller
{
     public function index()
    {

        $collectors = User::where('role', 'collector')->select('id', 'name', 'purok')->get();

        $contributions = ContributionModel::select('id', 'collector', 'purok', 'status')->get();

        $collectorStats = $collectors->map(function ($collector) use ($contributions) {
            // Match contributions by collector name
            $matchedContributions = $contributions->where('collector', $collector->name);

            return [
                'collector' => $collector->name,
                'purok' => $collector->purok,
                'members' => $matchedContributions->count(), //  Total members san kada collector
                'paid' => $matchedContributions->where('status', 'paid')->count(),
                'not_paid' => $matchedContributions->where('status', 'not_paid')->count(),
            ];
        });



        return Inertia::render('admin/dashboard/report/ReportHome', [
            'contributions' => $collectorStats,
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
