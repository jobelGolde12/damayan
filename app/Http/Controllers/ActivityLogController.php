<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class ActivityLogController extends Controller
{
    public function index(){
        $users = User::all();
        return Inertia::render('admin/activityLogs/Index', [
            'users' => $users,
        ]);
    }
    public function viewUser($id){
        $user = User::findOrFail($id);
        $isCurrentUserAdmin = Auth::user()->role == 'admin' ? true : false;
        return Inertia::render('admin/activityLogs/ViewUser', [
            'user' => $user,
            'isCurrentUserAdmin' => $isCurrentUserAdmin,
        ]);
    }
}
