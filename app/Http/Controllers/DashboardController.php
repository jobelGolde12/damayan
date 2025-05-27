<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index(){
      if (!Auth::check()) {
        return redirect()->route('login');
      }
      return Inertia::render('admin/dashboard/Home');
    }
    public function registeredMember(){
      return Inertia::render('admin/dashboard/RegisteredMember');
    }
}
