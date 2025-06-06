<?php

namespace App\Http\Controllers;

use App\Models\OfficialModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OfficialController extends Controller
{
    public function index(){
        $officials = OfficialModel::all();
        return Inertia::render('admin/dashboard/official/Home', [
            'officials' => $officials,
        ]);
    }
}
