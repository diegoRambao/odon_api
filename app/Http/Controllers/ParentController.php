<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class ParentController extends Controller
{
    private $procedure;
    private $table;

    public function __construct($procedure, $table){
        $this->procedure = $procedure;
        $this->table = $table;
    }

    public function getAll() {
        $res = DB::select("call {$this->procedure['getAll']}()");
        return json_decode($res[0]->data);
    }

    public function get($id) {
        $res = DB::select("call {$this->procedure['get']}({$id})");
        return json_decode($res[0]->data, true);
    }

    public function create(Request $req) {
        $arrayData = json_encode($req->all());
        $res = DB::select("call {$this->procedure['create']}('$arrayData')");
        $res = DB::select("SELECT MAX(id) AS id FROM {$this->table};");
        return $res[0]->id;
    }

    public function update(Request $req) {
        $arrayData = json_encode($req->all());
        $resBd = DB::select("call {$this->procedure['update']}('$arrayData')");
        $res = $resBd[0]->success == 1 ? true: false;
        return $res;
    }

    public function delete(Request $req) {
        $arrayData = json_encode($req->all());
        $resBd = DB::select("call {$this->procedure['delete']}('$arrayData')");
        $res = $resBd[0]->success == 1 ? true: false;
        return $res;
    }
}