<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TypeDocument;
use App\Http\Controllers\ParentController;

class TypeDocumentController extends ParentController
{
    function __construct() {
        parent::__construct(config('procedure.typeDocument'), 'type_documents');
    }
}
