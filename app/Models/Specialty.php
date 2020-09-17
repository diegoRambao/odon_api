<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Specialty extends Model
{
    protected $fillable = ['name', 'state'];
    protected $table = "specialties";
    public $timestamps = false;
    use HasFactory;
}
