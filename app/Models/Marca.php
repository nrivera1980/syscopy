<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    use HasFactory;

    protected $table = "marcas";
    protected $fillable = ['nombre', 'descripcion', 'estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function productos()
    {
        return $this->hasMany(libro::class);
    }
}
