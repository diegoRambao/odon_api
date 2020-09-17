<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GenderController;
use App\Http\Controllers\SpecialtyController;
use App\Http\Controllers\TypeDocumentController;

Route::get('gender', [GenderController::class, 'getAll']);
Route::get('gender/{id}',[GenderController::class, 'get']);
Route::post('gender', [GenderController::class, 'create']);
Route::put('gender/{id}', [GenderController::class, 'update']);
Route::delete('gender/{id}', [GenderController::class, 'delete']);

Route::get('specialty', [SpecialtyController::class, 'getAll']);
Route::get('specialty/{id}',[SpecialtyController::class, 'get']);
Route::post('specialty', [SpecialtyController::class, 'create']);
Route::put('specialty/{id}', [SpecialtyController::class, 'update']);
Route::delete('specialty/{id}', [SpecialtyController::class, 'delete']);

Route::get('type_document', [TypeDocumentController::class, 'getAll']);
Route::get('type_document/{id}',[TypeDocumentController::class, 'get']);
Route::post('type_document', [TypeDocumentController::class, 'create']);
Route::put('type_document/{id}', [TypeDocumentController::class, 'update']);
Route::delete('type_document/{id}', [TypeDocumentController::class, 'delete']);
