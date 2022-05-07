@foreach($subcategorias as $subcategoria)
    <ul class="menu" x-show="show">
        <li x-data={show:false}>
            @if(count($subcategoria->children))
                @if (!empty($mrc) && $mrc == $subcategoria->id)
                    <a x-on:click.prevent="show=!show" class="active"><i class="fa fa-arrow-right mr-2"></i> <p class="text-base">{{$subcategoria->nombre}}</p></a>
                @else
                    <a x-on:click.prevent="show=!show"><i class="fa fa-arrow-right mr-2"></i> <p class="text-base">{{$subcategoria->nombre}}</p></a>
                @endif
                @include('subcategoria',['subcategorias' => $subcategoria->children, 'dataParent' => $subcategoria->id])
            @else
                @if (!empty($id) && $id == $subcategoria->id)
                    <a href="{{route('producto', $subcategoria->id)}}" class="active"> <p class="text-base">{{$subcategoria->nombre}}</p></a>
                @else
                    <a href="{{route('producto', $subcategoria->id)}}"> <p class="text-base">{{$subcategoria->nombre}}</p></a>
                @endif
            @endif
        </li>
    </ul>
@endforeach
