<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Specialty;

class SpecialtyController extends Controller
{
    public function getAll() {
        $specialties = Specialty::all();
        return response()->json($specialties, 200);
    }

    public function get($id) {
        $specialty = Specialty::find($id);
        return response()->json($specialty, 200);
    }

    public function create(Request $req) {
        $specialty = Specialty::create($req->all());
        return response()->json($specialty, 201);
    }

    public function update(Request $req, $id) {
        $specialty = Specialty::findOrFail($id);
        $specialty->update($req->all());
        return response()->json($specialty, 200);
    }

    public function delete($id) {
        $specialty = Specialty::find($id);
        $response = $specialty->delete();
       return response()->json($response, 204);
    }
}
