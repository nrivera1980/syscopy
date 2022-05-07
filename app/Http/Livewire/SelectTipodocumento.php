<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Tipodocumento;

class SelectTipodocumento extends Component
{
    public $selectedTipodocumento = null;

    public function render()
    {
        return view('livewire.select-tipodocumento', [
            'tipodocumentos' => Tipodocumento::where('estado', 1)->get()
        ]);
    }
}
