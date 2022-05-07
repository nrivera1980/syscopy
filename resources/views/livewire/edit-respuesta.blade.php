<div>
    <a class="btna btna-green" wire:click="$set('open', true)">
        <i class="fas fa-edit"></i>
    </a>

    <x-jet-dialog-modal wire:model="open">

        <x-slot name="title">
            Editar respuesta
        </x-slot>

        <x-slot name="content">
            <div class="mb-4">
                <x-jet-label value="Responsable" />
                <x-jet-input wire:model="respuesta.responsable" type="text" class="w-full" />
                <x-jet-input-error for="responsable" />
            </div>
            <div class="mb-4">
                <x-jet-label value="Respuesta" />
                <textarea wire:model="respuesta.respuesta" rows="6" class="form-control w-full"></textarea>
                <x-jet-input-error for="respuesta" />
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-4">
                        <x-jet-label value="Fecha" />
                        <x-jet-input type="date" class="w-full" wire:model="respuesta.fecha" />
                        <x-jet-input-error for="fecha" />
                    </div>
                </div>
                <div class="col">
                    <div class="mb-4">
                        <x-jet-label value="Hora" />
                        <x-jet-input type="time" class="w-full" wire:model="respuesta.hora" />
                        <x-jet-input-error for="hora" />
                    </div>
                </div>
            </div>
        </x-slot>

        <x-slot name="footer">
            <x-jet-secondary-button wire:click="$set('open', false)">
                Cancelar
            </x-jet-secondary-button>

            <x-jet-danger-button wire:click="save" wire:loading.attr="disabled" wire:target="save" class="disabled:opacity-25">
                Actualizar
            </x-jet-danger-button>
        </x-slot>

    </x-jet-dialog-modal>
</div>
