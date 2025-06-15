<?php

namespace App\Http\Controllers;

use App\Models\memberModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index(){
      if (!Auth::check()) {
        return redirect()->route('login');
      }
      if(Auth::user()->role === 'admin') {
        return Inertia::render('admin/dashboard/Home');
      }else if(Auth::user()->role === 'collector') {
        return Inertia::render('collector/dashboard/Home');
      }
      
    }
    public function registeredMember(){
      $members = memberModel::all();
      return Inertia::render('admin/dashboard/RegisteredMember', [
        'members' => $members
      ]);
    }
}
