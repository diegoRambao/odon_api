<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gender extends Model
{
    protected $fillable = ['name', 'code'];
    protected $table = "genders";
    public $timestamps = false;
    use HasFactory;
}
