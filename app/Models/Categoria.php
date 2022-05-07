<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;

    protected $table = "categorias";
    protected $fillable = ['nombre', 'descripcion', 'estado', 'orden', 'categoria_id', 'slug', 'padre'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function getRouteKeyName()
    {
        return "slug";
    }

    public function productos()
    {
        return $this->hasMany(Producto::class);
    }

    public function sub3categorias()
    {
        return $this->hasMany(Categoria::class, 'categoria_id');
    }

    public function sub2categorias()
    {
        return $this->hasMany(Categoria::class, 'categoria_id')->with('sub3categorias');
    }

    public function subcategorias()
    {
        return $this->hasMany(Categoria::class, 'categoria_id')->with('sub2categorias');
    }

    public function parent()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id');
    }

    public function children()
    {
        return $this->hasMany(Categoria::class, 'categoria_id');
    }

    public function childCategories()
    {
        return $this->hasMany(Categoria::class, 'categoria_id');

    }

    public function childrenRecursive()
    {
        return $this->children()->with('childrenRecursive');
    }
}
