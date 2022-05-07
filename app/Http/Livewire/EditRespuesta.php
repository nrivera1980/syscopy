<?php

namespace App\Http\Livewire;

use App\Models\Respuesta;
use Livewire\Component;

class EditRespuesta extends Component
{
    public $open = false;
    public $respuesta;

    protected $rules = [
        'respuesta.responsable' => 'required',
        'respuesta.respuesta' => 'required',
        'respuesta.fecha' => 'required|date',
        'respuesta.hora' => 'required'
    ];
    
    public function mount(Respuesta $respuesta){
        $this->respuesta = $respuesta;
    }

    public function save(){
        $this->validate();
        $this->respuesta->save();

        $this->reset(['open']);
        $this->emitTo('show-respuestas', 'render');

        $this->emit('alert', 'La respuesta se actualizó satisfactoriamente !');
    }
    
    public function render()
    {
        return view('livewire.edit-respuesta');
    }
}
