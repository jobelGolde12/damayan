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
        $isCurrentUserAdmin = Auth::user()->role == 'admin' ? true : false; //define if current user = admin
        $isSameUser = Auth::id() == $id ? true : false; //define if the current viewing his/her data then d niya pwede eh delete ang kaniya account
        return Inertia::render('admin/activityLogs/ViewUser', [
            'user' => $user,
            'isCurrentUserAdmin' => $isCurrentUserAdmin,
            'isSameUser' => $isSameUser,
        ]);
    }
    public function edit($id)
    {
        $user = User::findOrFail($id);
        return Inertia::render('admin/activityLogs/EditUser', [
            'user' => $user,
        ]);
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'role' => 'required|string',
        ]);

        $user->update($validated);

        return redirect()->back()->with('success', 'User updated successfully!');
    }
}
