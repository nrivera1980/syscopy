<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{
    use HasFactory;

    protected $table = "tienda";
    protected $fillable = ['nombre', 'empresa', 'ruc', 'direccion', 'telefono', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function libros()
    {
        return $this->hasMany(libro::class);
    }
}
