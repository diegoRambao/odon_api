<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Specialty;
use App\Http\Controllers\ParentController;

class SpecialtyController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.specialty'), 'specialties');
    }
}
