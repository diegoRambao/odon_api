<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dentist extends Model
{
    protected $fillable = ['note', 'person_id', 'specialties_id'];
    protected $table = "dentist";
    public $timestamps = false;
    use HasFactory;
}
