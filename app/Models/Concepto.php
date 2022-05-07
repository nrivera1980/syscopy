<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Concepto extends Model
{
    use HasFactory;

    protected $table = "concepto";
    protected $fillable = ['nombre', 'tipo', 'descripcion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function libros()
    {
        return $this->hasMany(libro::class);
    }
}
