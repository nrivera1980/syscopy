<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Red;

class PiePagina extends Component
{
    public function render()
    {
        $redes = Red::where('estado', 1)->get();
        return view('livewire.pie-pagina', compact('redes'));
    }
}
