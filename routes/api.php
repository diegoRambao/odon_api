<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\DentistController;
use App\Http\Controllers\GenderController;
use App\Http\Controllers\SpecialtyController;
use App\Http\Controllers\TypeDocumentController;
use App\Http\Controllers\UserController;

Route::get('appointment', [AppointmentController::class, 'getAll']);
Route::get('appointment/{id}',[AppointmentController::class, 'get']);
Route::post('appointment', [AppointmentController::class, 'create']);
Route::put('appointment/{id}', [AppointmentController::class, 'update']);
Route::delete('appointment/{id}', [AppointmentController::class, 'delete']);

Route::get('dentist', [DentistController::class, 'getAll']);
Route::get('dentist/{id}',[DentistController::class, 'get']);
Route::post('dentist', [DentistController::class, 'create']);
Route::put('dentist/{id}', [DentistController::class, 'update']);
Route::delete('dentist/{id}', [DentistController::class, 'delete']);

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

Route::get('user', [UserController::class, 'getAll']);
Route::get('user/{id}',[UserController::class, 'get']);
Route::post('user', [UserController::class, 'create']);
Route::put('user/{id}', [UserController::class, 'update']);
Route::delete('user/{id}', [UserController::class, 'delete']);
