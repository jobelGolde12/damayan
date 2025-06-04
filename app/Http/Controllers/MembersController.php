<?php

namespace App\Http\Controllers;

use App\Models\BeneficiaryModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class MembersController extends Controller
{
    public function viewMemberInfo($id){
        $mem = memberModel::with('beneficiaries')->find($id);
        if(!$mem){
            return response()->json(['error: ' => 'cannot find member'], 404);
        }
        // Log::info(["bene: " => $bene]);
        return Inertia::render('admin/dashboard/ViewMember', [
            'member' => $mem,
        ]);
    }
    public function editMember($id){
        $mem = memberModel::with('beneficiaries')->find($id);
        if(!$mem){
            return response()->json(['error: ' => 'cannot find user'], 404);
        }

        return Inertia::render('admin/dashboard/EditMember', [
            'member' => $mem,
        ]);
    }
}
