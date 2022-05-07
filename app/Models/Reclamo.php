<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reclamo extends Model
{
    use HasFactory;

    protected $table = "libro";
    protected $fillable = ['estado'];
    protected $guarded = ['id'];
    public $timestamps = false;

    public function concepto()
    {
        return $this->belongsTo(Concepto::class);
    }
}
