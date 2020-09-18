<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParentController;

class UserController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.user'), 'users');
    }
}
