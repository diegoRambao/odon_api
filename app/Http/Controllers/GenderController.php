<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Gender;

class GenderController extends Controller
{
    public function getAll() {
        $genders = Gender::all();
        return response()->json($genders, 200);
    }

    public function get($id) {
        $gender = Gender::find($id);
        return response()->json($gender, 200);
    }

    public function create(Request $req) {
        $gender = Gender::create($req->all());
        return response()->json($gender, 201);
    }

    public function update(Request $req, $id) {
        $gender = Gender::findOrFail($id);
        $gender->update($req->all());
        return response()->json($gender, 200);
    }

    public function delete($id) {
        $gender = Gender::find($id);
        $response = $gender->delete();
       return response()->json($response, 204);
    }
}