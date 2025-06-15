<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class CollectorController extends Controller
{
    public function index()
    {
        return Inertia::render('collector/dashboard/Home');
    }
}
