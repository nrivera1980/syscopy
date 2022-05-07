<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Canal;

class SelectCanal extends Component
{
    public $canal;

    public function render()
    {
        return view('livewire.select-canal', [
            'canales' => Canal::where('estado', 1)->get()
        ]);
    }
}
