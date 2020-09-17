<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeDocument extends Model
{
    protected $fillable = ['name', 'code'];
    protected $table = "type_documents";
    public $timestamps = false;
    use HasFactory;
}
