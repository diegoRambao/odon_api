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
        $user = json_decode($request->user, true);
        $person = $user['person'];
        if($request->file('imgUrl')){
            if(File::exists(public_path('img/'. $person['imgUrl']))){
                File::delete(public_path('img/'. $person['imgUrl']));
            }
            $cover = $request->file('imgUrl');
            $extension = $cover->getClientOriginalExtension();
            Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));

            $person['imgUrl'] = $cover->getFilename().'.'.$extension;
            $user['person'] = $person;
        }
        $arrayData = json_encode($user);
        $resBd = DB::select("call update_user('$arrayData')");
        return $user;
    }
}
