<x-app-layout>
    <div>
        <div class="mx-auto">
            <div>
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-2xl lg:text-5xl font-bold text-red-600 shadow-lg" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div><p style="text-align: center;">Catálogo</p></div>
                        <div>─────</div>
                    </div>
                </div>
                {{-- cuerpo de catalogo --}}
                <div class="flex flex-wrap max-w-7xl mx-auto">

                    {{-- <div class="row"> --}}
                    <div class="lg:w-3/12 md:w-1/2 w-full p-5">
                        <div class="artboard bg-base-200 w-full">
                            <ul class="menu p-4 shadow-2xl bg-base-100 rounded-box">
                                <li>
                                    <a href="{{route('catalogo')}}"><i class="fa fa-clipboard-list mr-2"></i> <p class="text-base">Todos</p></a>
                                </li>
                                @if (auth()->id())
                                    <li>
                                        <a href="{{route('deseados')}}"><i class="fa fa-icons mr-2"></i><p class="text-base">Deseados</p></a>
                                    </li>
                                @endif
                                @foreach($categorias as $categoria)
                                    <li x-data={show:false}>
                                        @if (!empty($cat) && $cat == $categoria->id)
                                            <a x-on:click.prevent="show=!show" class="active"><i class="fa fa-arrow-right mr-2"></i> <p class="text-base">{{$categoria->nombre}}</p></a>
                                        @else
                                            <a x-on:click.prevent="show=!show"><i class="fa fa-arrow-right mr-2"></i> <p class="text-base">{{$categoria->nombre}}</p></a>
                                        @endif
                                        
                                        @if(count($categoria->children))
                                            @include('subcategoria',['subcategorias' => $categoria->children, 'dataParent' => $categoria->id])
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>

                    <div class="lg:w-9/12 md:w-1/2 w-full p-5">
                        @if (count($productos) == 0)
                            @if (!empty($btnnodeseado))
                                <div class="p-2">
                                    <p class="text-red-700 text-lg lg:text-2xl">Aún no ha seleccionado un producto como deseado, lo invitamos a que elija entre nuestros productos de calidad</p>
                                </div>
                            @else
                                <div class="p-2">
                                    <p class="text-red-700 text-lg lg:text-2xl">Muy pronto tendremos productos de esta categoría, mientras tanto siga en nuestro catalogo</p>
                                </div>
                            @endif
                        @else
                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">                            
                                @foreach ($productos as $producto)
                                    <div class="mb-5">
                                        <div class="card text-center shadow-2xl" style="height:572px;">
                                            <figure class="px-10 pt-10">
                                                <img src="{{Storage::url($producto->imagen)}}" class="rounded-xl">
                                            </figure>
                                            <div class="card-body">
                                                <h2 class="card-title" style="color: #000000">{{$producto->nombre}}</h2>
                                                <p style="color: #000000">{!!strip_tags(Str::limit($producto->descripcion, 50))!!}</p>
                                                <div class="justify-center card-actions">
                                                    <a href="{{route('detalle.producto', $producto->id)}}" class="btn btn-outline btn-accent">Más información</a>
                                                </div>
                                                @if (!empty($btnnodeseado))
                                                    <form method="post" action="{{ route('nodeseo.producto') }}">
                                                        @csrf
                                                        <div class="justify-center card-actions">
                                                            <input type="hidden" id="id" name="id" value="{{$producto->id}}">
                                                            <input class="btn btn-outline btn-secondary" type="submit" value="Ya no lo deseo">
                                                            {{-- <a href="{{route('nodeseo_producto', $producto->id)}}" class="btn btn-outline btn-secondary">Ya no lo deseo</a> --}}
                                                        </div>
                                                    </form>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                        <div>
                            {{$productos->render()}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@if (!empty($deseado))
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Se ha añadido el producto a tu lista de deseados',
            showConfirmButton: false,
            timer: 2500
        })
    </script>
@endif
@if (!empty($nodeseado))
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Se ha retirado el producto a tu lista de deseados',
            showConfirmButton: false,
            timer: 2500
        })
    </script>
@endif