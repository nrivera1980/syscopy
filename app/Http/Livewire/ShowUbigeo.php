<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\Distrito;

class ShowUbigeo extends Component
{
    public $departamento;
    public $provincias=[];
    public $provincia;
    public $distritos=[];
    public $distrito;

    public function render()
    {
        return view('livewire.show-ubigeo', [
            'departamentos' => Departamento::where('estado', 1)->get()
        ]);
    }

    public function updateddepartamento($dpto_id)
    {
        $this->provincias = Provincia::where('departamento_id', $dpto_id)->get();
    }

    public function updatedprovincia($prov_id)
    {
        $this->distritos = Distrito::where('provincia_id', $prov_id)->get();
    }
}
