<div class="flex flex-wrap -m-2">
    <div class="p-2 w-full">
        <div class="relative">
            <x-jet-label for="motivo" value="Motivo*:"></x-jet-label>
            <select name="motivo" id="motivo" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" wire:change="changeSituacion($event.target.value)" required>
                <option value="">Seleccione</option>
                <option value="Q">QUEJA</option>
                <option value="R">RECLAMO</option>
            </select>
        </div>
    </div>
    <div class="p-2 w-full">
        <div class="w-full py-3 px-5 bg-blue-200 border border-blue-400 rounded-lg">
            <p><span class="font-bold">Queja:</span> Descontento respecto a la atención al publico o Disconformidad no relacionada a los productos o servicios.</p>
            <p><span class="font-bold">Reclamo:</span> Disconformidad relacionada a los productos o servicios.</p>
        </div>
    </div>
    <div class="p-2 w-full">
        <div class="relative">
            <x-jet-label for="detalle" value="Detalle*:"></x-jet-label>
            @if (!is_null($conceptos))
            <select wire:model="concepto" name="detalle" id="detalle" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
                @foreach ($conceptos as $concepto)
                <option value="{{$concepto->id}}">{{$concepto->nombre}}</option>
                @endforeach
            </select>
            @else
            <select name="detalle" id="detalle" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="" selected>Seleccione</option>
            </select>
            @endif

        </div>
    </div>
</div>
