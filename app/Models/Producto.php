<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $table = "productos";
    protected $fillable = ['nombre', 'descripcion', 'detalles', 'estado', 'imagen', 'categoria_id', 'facebook', 'compartir'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }

    public function categorias()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id');

    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'wishes', 'productos_id', 'users_id');
    }
}
