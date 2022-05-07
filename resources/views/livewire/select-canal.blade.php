<div>
    <select name="canal" id="canal" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
        <option value="">Seleccione</option>
        @foreach ($canales as $c)
        <option value="{{$c->id}}">{{$c->nombre}}</option>
        @endforeach
    </select>
</div>
