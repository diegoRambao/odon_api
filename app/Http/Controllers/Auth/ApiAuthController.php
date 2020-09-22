<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Auth;
use DB;

class ApiAuthController extends Controller
{

    public function register (Request $req) {
        $req['password']=Hash::make($req['password']);
        $arrayData = json_encode($req->all());
        $res = DB::select("call create_user('$arrayData')");
        $res = DB::select("SELECT MAX(id) AS id FROM users;");
        return $res[0]->id;
    }

    public function login (Request $req) {
        $user = DB::select("call get_user_by_email('$req->email')");
        $user = json_decode($user[0]->data, true);
        if($user) {
            if(Hash::check($req->password, $user['password'])){
                $token = Str::random(60);
                $token = Hash::make($token);
                $user['token'] = $token;
                return $user;
            }else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        }else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
        return $user;
    }
}
