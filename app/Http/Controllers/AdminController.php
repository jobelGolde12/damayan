<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class AdminController extends Controller
{
    public function addNewMember(){
        return Inertia::render('admin/dashboard/AddNewMember');
    }
}
