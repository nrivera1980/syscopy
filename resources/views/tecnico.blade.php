<x-app-layout>
    <div>
        <div class="mx-auto">
            
            <div>
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-2xl lg:text-5xl font-bold text-red-600" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div><p style="text-align: center;">Servicio técnico</p></div>
                        <div>─────</div>
                    </div>
                </div>

                <section class="bg-cover bg-center" style="background-image: url({{asset('img/fn_servicio_tecnico.jpg')}})">
                    <div class="flex justify-around items-center max-w-7xl mx-auto">
                        <div class="my-20 h-auto w-11/12 flex flex-col">
                            <h1 class="text-white text-xl lg:text-4xl">Solicitar servicio</h1>
                            <form action="{{route('contacto.servicio')}}" method="POST">
                                @csrf
                                <div class="flex flex-wrap lg:w-5/12 w-full lg:w-80">
                                
                                    <div class="p-2 w-full">
                                        <div class="relative">
                                            <label for="nombre" class="leading-7 text-sm text-white">Nombre completo</label>
                                            <input type="text" id="nombre" name="nombre" class="w-full bg-white rounded border border-white focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-black py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
                                        </div>
                                    </div>
                                    <div class="p-2 w-full">
                                        <div class="relative">
                                            <label for="direccion" class="leading-7 text-sm text-white">Dirección</label>
                                            <input type="text" id="direccion" name="direccion" class="w-full bg-white rounded border border-white focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-black py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
                                        </div>
                                    </div>
                                    <div class="p-2 w-1/2">
                                        <div class="relative">
                                            <label for="empresa" class="leading-7 text-sm text-white">Empresa</label>
                                            <input type="text" id="empresa" name="empresa" class="w-full bg-white rounded border border-white focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-black py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
                                        </div>
                                    </div>
                                    <div class="p-2 w-1/2">
                                        <div class="relative">
                                            <label for="telefono" class="leading-7 text-sm text-white">Teléfono</label>
                                            <input type="text" id="telefono" name="telefono" class="w-full bg-white rounded border border-white focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-black py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
                                        </div>
                                    </div>
                                    <div class="p-2 w-full">
                                        <div class="relative">
                                            <label for="mensaje" class="leading-7 text-sm text-white">Mensaje</label>
                                            <textarea id="mensaje" name="mensaje" class="w-full bg-white rounded border border-white focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-black py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></textarea>
                                        </div>
                                    </div>
                                    <div class="p-2 w-full my-10">
                                        <button type="submit" class="flex mx-auto text-red-600 bg-gray-300 border-0 py-3 px-12 focus:outline-none hover:bg-gray-100 text-lg font-bold">SOLICITAR</button>
                                    </div>
                                
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            
            </div>

        </div>
    </div>
</x-app-layout>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@if (!empty($msjst))
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Solicitud enviada, muy pronto le responderemos, gracias.',
            showConfirmButton: false,
            timer: 3000
        })
    </script>
@endif