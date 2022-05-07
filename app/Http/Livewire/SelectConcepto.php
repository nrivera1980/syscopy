<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Concepto;

class SelectConcepto extends Component
{
    public $concepto=null;
    public $conceptos=null;
    
    public function render()
    {
        return view('livewire.select-concepto');
    }

    public function changeSituacion($tipo){
        $this->conceptos = Concepto::where('tipo', $tipo)->get();
    }
}
