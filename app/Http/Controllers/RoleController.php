<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class RoleController extends Controller
{
    public function index()
    {
        $users = User::all();
        return Inertia::render('admin/roleManagementPage/Index', [
            'users' => $users,
        ]);
    }
    public function edit(User $user)
    {
        return Inertia::render('admin/roleManagementPage/Edit', [
            'user' => $user
        ]);
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email,' . $user->id,
            'role' => 'required|',
            'password' => 'nullable|string|min:6',
        ]);

        $user->name = $validated['name'];
        $user->email = $validated['email'];
        $user->role = $validated['role'];

        if (!empty($validated['password'])) {
            $user->password = Hash::make($validated['password']);
        }

        $user->save();

        return redirect()->back()->with('success', 'User updated successfully.');
    }

    public function add(){
        return Inertia::render('admin/roleManagementPage/Add');
    }
    public function addUser(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email',
            'role' => 'required|',
            'password' => 'required|string|min:6',
        ]);

        User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'role' => $validated['role'],
            'password' => Hash::make($validated['password']),
        ]);

        return redirect()->back()->with('success', 'User added successfully.');
    }

    public function destroy(User $user)
    {
        if (!$user) {
            return response()->json(['error' => 'You cannot delete your own account.']);
        }
        $user->delete();
        return redirect()->back()->with('success', 'User deleted successfully.');
    }

}
