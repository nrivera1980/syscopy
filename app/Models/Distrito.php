<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Distrito extends Model
{
    use HasFactory;

    protected $table = "distrito";
    protected $fillable = ['nombre', 'ubigeo', 'estado', 'provincia_id'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function libros()
    {
        return $this->hasMany(libro::class);
    }

    public function provincia()
    {
        return $this->belongsTo(Provincia::class);
    }
}
