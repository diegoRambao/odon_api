<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TypeDocument;

class TypeDocumentController extends Controller
{
    public function getAll() {
        $typeDocuments = TypeDocument::all();
        return response()->json($typeDocuments, 200);
    }

    public function get($id) {
        $typeDocuments = TypeDocument::find($id);
        return response()->json($typeDocuments, 200);
    }

    public function create(Request $req) {
        $typeDocument = TypeDocument::create($req->all());
        return response()->json($typeDocument, 201);
    }

    public function update(Request $req, $id) {
        $typeDocument = TypeDocument::findOrFail($id);
        $typeDocument->update($req->all());
        return response()->json($typeDocument, 200);
    }

    public function delete($id) {
        $typeDocument = TypeDocument::find($id);
        $response = $typeDocument->delete();
       return response()->json($response, 204);
    }
}
