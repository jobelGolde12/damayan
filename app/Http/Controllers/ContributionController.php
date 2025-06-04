<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class ContributionController extends Controller
{
    public function index(){
        return Inertia::render('admin/dashboard/contribution/MemberContribution');
    }
}
