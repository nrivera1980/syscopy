<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class libro extends Model
{
    use HasFactory;

    protected $table = "libro";
    protected $fillable = ['fecha', 'hora', 'documento', 'cliente', 'domicilio', 'email', 'celular', 'telefono', 'menor', 'docpadre', 'numpadre', 'padre', 'emailpadre', 'telefonopadre', 'bien', 'fechapedido', 'detalle', 'importe', 'pedido', 'estado', 'responsable', 'fecharspta', 'distrito_id', 'canal_id', 'concepto_id', 'tienda_id', 'documento_id', 'ano'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function tienda()
    {
        return $this->belongsTo(Tienda::class);
    }

    public function tipodocumento()
    {
        return $this->belongsTo(Tipodocumento::class, 'documento_id');
    }

    public function distrito()
    {
        return $this->belongsTo(Distrito::class);
    }

    public function concepto()
    {
        return $this->belongsTo(Concepto::class);
    }

    public function canal()
    {
        return $this->belongsTo(Canal::class);
    }

    public function respuestas()
    {
        return $this->hasMany(Respuesta::class);
    }
}
