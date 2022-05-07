<?php

namespace App\Http\Livewire;

use App\Models\Respuesta;
use Livewire\Component;

class CreateRespuesta extends Component
{
    public $open = false;

    public $respuesta, $responsable, $fecha, $hora;

    public $reclamoId;

    protected $rules = [
        'respuesta' => 'required',
        'responsable' => 'required',
        'fecha' => 'required|date',
        'hora' => 'required'
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

    public function save()
    {
        $this->validate();
        
        Respuesta::create([
            'respuesta' => $this->respuesta,
            'responsable' => $this->responsable,
            'fecha' => $this->fecha,
            'hora' => $this->hora,
            'libro_id' => $this->reclamoId
        ]);

        $this->reset(['open', 'respuesta', 'responsable', 'fecha', 'hora']);

        $this->emitTo('show-respuestas', 'render');
        $this->emit('alert', 'La respuesta de creo satisfactoriamente !');
    }

    public function render()
    {
        return view('livewire.create-respuesta');
    }
}
