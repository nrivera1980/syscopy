<div class="flex flex-wrap -m-2">
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="tienda" value="Tienda*"></x-jet-label>
            <select wire:model="selectedTienda" id="tienda" name="tienda" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" wire:click="changeEvent($event.target.value)" required autofocus>
                <option value="">Seleccione</option>
                @foreach ($tiendas as $tienda)
                <option value="{{$tienda->id}}">{{$tienda->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            @if (!is_null($tiendita))
                @foreach ($tiendita as $t)
                <p><span class="font-bold">Razón Social:</span> {{$t->empresa}}</p>
                <p><span class="font-bold">Ruc:</span> {{$t->ruc}}</p>
                <p><span class="font-bold">Dirección:</span> {{$t->direccion}}</p>
                @endforeach
            @else
            <p><span class="font-bold">Razón Social:</span> </p>
            <p><span class="font-bold">Ruc:</span> </p>
            <p><span class="font-bold">Dirección:</span> </p>
            @endif
        </div>
    </div>
</div>
