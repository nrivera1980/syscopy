<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Tienda;

class SelectTienda extends Component
{
    public $selectedTienda = null;
    public $tiendita = null;

    public function render()
    {
        return view('livewire.select-tienda', [
            'tiendas' => Tienda::where('estado', 1)->get()
        ]);
    }

    public function changeEvent($id_tienda){
        $this->tiendita = Tienda::where('id', $id_tienda)->get();
    }
}
