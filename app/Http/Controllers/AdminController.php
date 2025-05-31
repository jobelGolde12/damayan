<?php

namespace App\Http\Controllers;

use App\Models\BeneficiaryModel;
use App\Models\memberModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class AdminController extends Controller
{
    public function addNewMember(){
        $bene = BeneficiaryModel::where('user_id', Auth::id())->get();;
        return Inertia::render('admin/dashboard/AddNewMember', [
            'beneficiary' => $bene
        ]);
    }
    public function addMemberPost(Request $request){

        $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'contact_number' => 'required|max:255',
            'date_of_birth' => 'required|date|max:255',
            'registration_date' => 'required|date|max:255',
            'purok' => 'required|max:255',
            'age' => 'required|date|max:255',
            'middle_name' => 'required|string|max:255',
            'status' => 'required|string|max:255',
            'occupation' => 'required|string|max:255'

        ]);
        memberModel::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'address' => $request->address,
            'contact_number' => $request->contact_number,
            'date_of_birth' => $request->date_of_birth,
            'registration_date' => $request->registration_date,
            'purok' => $request->purok,
            'age' => $request->age,
            'middle_name' => $request->middle_name,
            'status' => $request->status,
            'occupation' => $request->occupation
        ]);

        return response()->json(['message: ' => 'Member updated successfully...'], 201);
    }

    public function addBeneficiary(Request $request){
        // dd(['request' => $request->all()]);
        $request->validate([
            'name' => 'required|string|max:255',
            'relation' => 'required|string|max:255',
            'age' => 'required',
            'birth_date' => 'required|date'
        ]);
        // if(!$request->validate()){
        //     return response()->json(['error =>' => 'cannot validate']);
        // }
        BeneficiaryModel::create([
            'user_id' => Auth::id(),
            'name' => $request->name,
            'relation' => $request->relation ?: null,
            'age' => $request->age ?: null,
            'birth_date' => $request->birth_date ?: null,
        ]);

        // $bene = BeneficiaryModel::where('user_id', Auth::id())->get();
        // return Inertia::render('admin/dashboard/AddNewMember', [
        //     'beneficiary' => $bene
        // ]);
    }

    public function deleteBeneficiary($id){
        $bene = BeneficiaryModel::find($id);
        if(!$bene){
            return response()->json(['Error: ' => 'cannot find beneficiary data.']);
        }
        $bene->delete();
    }
}
