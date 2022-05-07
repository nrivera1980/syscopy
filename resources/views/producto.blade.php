<x-app-layout>
    <div>
        <div class="mx-auto">
            <div>
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-2xl lg:text-5xl font-bold text-red-600 shadow-lg" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div><p style="text-align: center;">{{$producto->nombre}}</p></div>
                        <div>─────</div>
                    </div>
                </div>
                {{-- cuerpo de catalogo --}}
                <div class="flex flex-wrap max-w-7xl mx-auto">
                    
                    <div class="lg:w-1/2 w-full p-5">
                        <div class="h-7 font-bold"><a href="{{route('catalogo')}}"><i class="fa fa-chevron-left"></i> Volver a la tienda</a></div>
                        <div class="">
                            <img class="object-contain" src="{{Storage::url($producto->imagen)}}" alt="">
                        </div>
                    </div>

                    <div class="lg:w-1/2 w-full p-5">

                        <div class="">
                            <div class="py-4">
                                <p class="text-xl lg:text-3xl font-bold text-red-600">Descripción y características</p>
                            </div>
                            <div id="divproducto" class="py-2">
                                {!! $producto->descripcion !!}
                            </div>
                            @if (auth()->id())
                                @if (count($deseado) == 0)
                                    <div class="flex justify-center p-6">
                                        <div>
                                            <a href="{{route('deseadosxuser', $producto->id)}}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-10 border border-blue-700 rounded">¡LO DESEO!</a>
                                        </div>
                                    </div>
                                @endif
                            @endif
                            <div class="p-6 ">
                                <div class="flex justify-around items-center text-xl lg:text-3xl font-bold text-red-600">
                                    <div>──────</div>
                                    <div><p style="text-align: center;">Detalles</p></div>
                                    <div>──────</div>
                                </div>
                            </div>
                            <div class="py-2">
                                <p class="text-black">{!!$producto->detalles!!}</p>
                            </div>
                            <div class="py-2">
                                <p class="text-black">Compartir:</p>
                                <!-- Go to www.addthis.com/dashboard to customize your tools --> <div class="addthis_inline_share_toolbox"></div>
                            </div>
                            {{-- @if ($producto->facebook)
                                <div class="py-2">
                                    <p class="text-black">Compartir: 
                                        <a href="{{$producto->facebook}}" target="_blank"><i class="fab fa-facebook fa-2x text-blue-800"></i></a>
                                        @if ($producto->compartir)
                                        <a href="mailto:{{$producto->compartir}}"><i class="fas fa-envelope fa-2x text-yellow-500"></i></a>
                                        @endif
                                    </p>
                                </div>
                            @endif --}}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
<style>
    .image-wrapper img {
        position: absolute;
        object-fit: cover;
        width: 100%;
        height: 100%;
    }
    ul {
        list-style-type: disc;
        list-style-position: inside;
    }
    ol {
        list-style-type: upper-roman;
        list-style-position: inside;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#divproducto a').attr('class', 'text-blue-700 no-underline hover:underline');
	});
</script>