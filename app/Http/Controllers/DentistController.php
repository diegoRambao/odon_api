<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParentController;

class DentistController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.dentist'), 'dentists');
    }
}