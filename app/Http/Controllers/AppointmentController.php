<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParentController;
use DB;

class AppointmentController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.appointment'), 'appointments');
    }

    public function getAppointmentsByUser($id, $state = 0) {
        $res = DB::select("call get_all_appointments_by_user({$id},{$state})");
        return json_decode($res[0]->data);
    }
}
