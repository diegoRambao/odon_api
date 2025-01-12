<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Gender;
use App\Http\Controllers\ParentController;

class GenderController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.gender'), 'genders');
    }
}