<?php

namespace App\Http\Controllers;

use App\Models\memberModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ArchiveController extends Controller
{
    public function index(){
        $members = memberModel::onlyTrashed()->get();
        return Inertia::render('admin/dashboard/archive/Home', [
            'members' => $members
        ]);
    }
    public function view($id){
        $member = memberModel::onlyTrashed()->with('beneficiaries')->findOrFail($id);
        if(!$member){
            abort(404, "member not found");
        }
        return Inertia::render('admin/dashboard/archive/View', [
            'member' => $member
        ]);
    }
    public function deletePermanently($id){
        $member = memberModel::onlyTrashed()->with('beneficiaries')->findOrFail($id);
        $member->forceDelete();
        return redirect()->back()->with(['success' => 'Member deleted successfully...'], 201);
    }
}
