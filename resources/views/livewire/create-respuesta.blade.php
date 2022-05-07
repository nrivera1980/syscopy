<div>
    <x-jet-danger-button class="w-full" wire:click="$set('open', true)">
        Crear nueva respuesta al reclamo / queja
    </x-jet-danger-button>

    <x-jet-dialog-modal wire:model="open">

        <x-slot name="title">
            Crear nueva respuesta
        </x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-jet-label value="Responsable" />
                <x-jet-input type="text" class="w-full" wire:model="responsable" autofocus />
                <x-jet-input-error for="responsable" />
            </div>
            <div class="mb-4">
                <x-jet-label value="Respuesta" />
                <textarea rows="6" class="form-control w-full" wire:model="respuesta"></textarea>
                <x-jet-input-error for="respuesta" />
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-4">
                        <x-jet-label value="Fecha" />
                        <x-jet-input type="date" class="w-full" wire:model="fecha" />
                        <x-jet-input-error for="fecha" />
                    </div>
                </div>
                <div class="col">
                    <div class="mb-4">
                        <x-jet-label value="Hora" />
                        <x-jet-input type="time" class="w-full" wire:model="hora" />
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
                Crear Respuesta
            </x-jet-danger-button>

            {{-- <span wire:loading wire:target="save">Cargando ...</span> --}}
        </x-slot>

    </x-jet-dialog-modal>
</div>
