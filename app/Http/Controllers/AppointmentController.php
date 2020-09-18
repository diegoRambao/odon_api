<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParentController;

class AppointmentController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.appointment'), 'appointments');
    }
}
