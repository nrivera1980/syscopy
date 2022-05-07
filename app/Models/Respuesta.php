<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
    use HasFactory;

    protected $table = "respuestas";
    protected $fillable = ['respuesta', 'fecha', 'hora', 'responsable', 'libro_id'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function libro()
    {
        return $this->belongsTo(libro::class);
    }
}
