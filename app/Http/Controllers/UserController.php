<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParentController;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use DB;

class UserController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.user'), 'users');
    }

    public function update(Request $request) {
        $cover = $request->file('imgUrl');
        $extension = $cover->getClientOriginalExtension();
        Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));

        $user = json_decode($request->user, true);
        // $arrayData = json_decode($user, true);
        $person = $user['person'];
        $person['imgUrl'] = $cover->getFilename().'.'.$extension;
        $user['person'] = $person;

        $arrayData = json_encode($user);
        $resBd = DB::select("call update_user('$arrayData')");
        $res = $resBd[0]->success == 1 ? true: false;
        return $res;
    }
}
