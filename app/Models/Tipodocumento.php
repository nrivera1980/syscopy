<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipodocumento extends Model
{
    use HasFactory;

    protected $table = "documento";
    protected $fillable = ['id', 'nombre', 'estado'];
    protected $guarded = ['id'];
    protected $keyType = 'string';
    public $incrementing = false;
    public $timestamps = false;

    public function libros()
    {
        return $this->hasMany(libro::class);
    }
}
