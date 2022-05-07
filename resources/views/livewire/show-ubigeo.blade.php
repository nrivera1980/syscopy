<div class="flex flex-wrap -m-2">
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="departamento" value="Departamento*"></x-jet-label>
            <select wire:model="departamento" name="departamento" id="departamento" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
                @foreach ($departamentos as $dpto)
                <option value="{{$dpto->id}}">{{$dpto->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>

    @if (!is_null($provincias))
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="provincia" value="Provincia*"></x-jet-label>            
            <select wire:model="provincia" name="provincia" id="provincia" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
                @foreach ($provincias as $p)
                <option value="{{$p->id}}">{{$p->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>
    @else
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="provincia" value="Provincia*"></x-jet-label>
            <select name="provincia" id="provincia" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
            </select>   
        </div>
    </div>
    @endif

    @if (!is_null($distritos))
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="distrito" value="Distrito*"></x-jet-label> 
            <select wire:model="distrito" name="distrito" id="distrito" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
                @foreach ($distritos as $d)
                <option value="{{$d->id}}">{{$d->nombre}}</option>
                @endforeach
            </select>
        </div>
    </div>
    @else
    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="distrito" value="Distrito*"></x-jet-label> 
            <select name="distrito" id="distrito" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                <option value="">Seleccione</option>
            </select>
        </div>
    </div>
    @endif

    <div class="p-2 w-full lg:w-1/2">
        <div class="relative">
            <x-jet-label for="email" value="Correo electrónico*"></x-jet-label>
            <x-jet-input id="email" name="email" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('email')" required></x-jet-input>
        </div>
    </div>
</div>
