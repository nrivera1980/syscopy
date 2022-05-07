<div>
    <x-jet-label for="tipodocumento" value="Tipo de documento*"></x-jet-label>
    <select wire:model="selectedTipodocumento" name="tipodocumento" id="tipodocumento" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
        <option value="">Seleccione</option>
        @foreach ($tipodocumentos as $tipodocumento)
        <option value="{{$tipodocumento->id}}">{{$tipodocumento->nombre}}</option>
        @endforeach
    </select>
</div>
