<?php

namespace App\Http\Controllers;

use App\Models\AssistanceDistribution;
use App\Models\ContributionModel;
use App\Models\memberModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index(){
      if (!Auth::check()) {
        return redirect()->route('login');
      }


      //Get the charts data
      $month = Carbon::now()->month;
      $year = Carbon::now()->year;

      //total san collected
      $totalCollected = ContributionModel::whereMonth('payment_date', $month)
    ->whereYear('payment_date', $year)
    ->sum('amount');

    // Total Disbursed This Month
    $totalDisbursed = AssistanceDistribution::whereMonth('distribution_date', $month)
    ->whereYear('distribution_date', $year)
    ->sum('total_amount');

    // Balance
    $monthBalance = $totalCollected - $totalDisbursed;

    $currentMonthData = [
      'totalCollected' => $totalCollected,
      'totalDisbursed' => $totalDisbursed,
      'balance' => $monthBalance
    ];

    ////////////////////////////
    // Total for entire year
    $currentYear = Carbon::now()->year;

    $yearCollected = ContributionModel::whereYear('payment_date', $currentYear)
        ->sum('amount');

    $yearDisbursed = AssistanceDistribution::whereYear('distribution_date', $currentYear)
        ->sum('total_amount');

    $yearBalance = $yearCollected - $yearDisbursed;

      $yearData = [
      'yearCollected' => $yearCollected,
      'yearDisbursed' => $yearDisbursed,
      'yearBalance' => $yearBalance
    ];
    ///////////////////////////

    /////////////////////////
    //Para sa monthly overview
    $monthlyData = ContributionModel::selectRaw('MONTH(payment_date) as month, SUM(amount) as total_collected')
    ->whereYear('payment_date', $currentYear)
    ->groupByRaw('MONTH(payment_date)')
    ->get()
    ->keyBy('month');

    $monthlyDisbursement = AssistanceDistribution::selectRaw('MONTH(distribution_date) as month, SUM(total_amount) as total_disbursed')
        ->whereYear('distribution_date', $currentYear)
        ->groupByRaw('MONTH(distribution_date)')
        ->get()
        ->keyBy('month');
    
      $monthlyOverview = [
      'monthlyData' => $monthlyData,
      'monthlyDisbursement' => $monthlyDisbursement,
    ];
    ////////////////////////

    // redirect sa specific na dashboard depende sa role 
      if(Auth::user()->role === 'admin') {
        return Inertia::render('admin/dashboard/Home', [
          'currentMonthData' => $currentMonthData,
          'yearData' => $yearData,
          'monthlyOverview' => $monthlyOverview,
        ]);
      }else if(Auth::user()->role === 'collector') {
        return Inertia::render('collector/dashboard/Home', [
          'currentMonthData' => $currentMonthData,
          'yearData' => $yearData,
          'monthlyOverview' => $monthlyOverview,
        ]);
      }
      
    }
    public function registeredMember(){
      $members = memberModel::all();
      return Inertia::render('admin/dashboard/RegisteredMember', [
        'members' => $members
      ]);
    }
}
