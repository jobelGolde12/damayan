<?php

namespace App\Http\Controllers;

use App\Models\BeneficiaryModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MembersController extends Controller
{
    public function viewMemberInfo($id){
        $mem = memberModel::find($id);
        $bene = BeneficiaryModel::find($id);
        if(!$mem){
            return response()->json(['error: ' => 'cannot find member'], 404);
        }
        return Inertia::render('admin/dashboard/ViewMember', [
            'member' => $mem,
            'beneficiary' => $bene,
        ]);
    }
}
