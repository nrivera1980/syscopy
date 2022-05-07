<x-app-layout>
    <div>
        <div class="mx-auto">
            <div>
                <section class="text-black font-sans bg-white">
                    <form action="{{route('libro-reclamaciones.store')}}" method="POST">
                        @csrf
                    <div class="container px-5 py-10 mx-auto text-sm lg:text-base">
                        <div class="text-justify">
                            <h2 class="text-red-600 text-lg font-bold mb-5 uppercase">libro de reclamaciones</h2>
                            <p class="w-full mb-5">Agradecemos su interes en comunicarse con SYSCOPY. Conforme a lo establecido en código de la Protección y Defensa del consumidor contamos con un Libro de Reclamaciones a tu disposición para que puedas registrar tu queja o reclamo.</p>
                            <p class="w-full mb-5">Le recordamos que este canal de comunicación es exclusivo para Reclamos y Quejas, de canalizar un requerimiento distinto y no cumpla con esta naturaleza NO serán atendidos. Para consultas, sugerencias y solicitudes pueden comunicarse al 761-1603, de lunes a sabado desde las 08:00 a las 17:00 horas, o acercarse a cualquiera de nuestras tiendas.</p>
                            <p class="w-full font-bold">Por favor ingrese los datos solicitados.</p>
                            <p class="w-full mb-5">Fecha y hora: {{date('Y-m-d H:i:s')}}</p>
                            <input type="hidden" value="{{date('Y-m-d')}}" id="fecharegistro" name="fecharegistro">
                            <input type="hidden" value="{{date('H:i:s')}}" id="horaregistro" name="horaregistro">
                        </div>

                        @livewire('select-tienda')

                        <div class="flex flex-wrap -m-2">
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <h2 class="text-black text-lg font-bold uppercase">datos del consumidor</h2>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    @livewire('select-tipodocumento')
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="documento" value="Documento de identidad*"></x-jet-label>
                                    <x-jet-input id="documento" name="documento" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('documento')" required></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="cliente" value="Nombre y apellidos del cliente*"></x-jet-label>
                                    <x-jet-input id="cliente" name="cliente" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('cliente')" required></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="domicilio" value="Domicilio*"></x-jet-label>
                                    <x-jet-input id="domicilio" name="domicilio" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('domicilio')" required></x-jet-input>
                                </div>
                            </div>
                        </div>
                        
                        @livewire('show-ubigeo')
                        
                        <div class="flex flex-wrap -m-2">
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="telefono" value="Teléfono fijo (opcional)"></x-jet-label>
                                    <x-jet-input id="telefono" name="telefono" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('telefono')"></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="celular" value="Teléfono celular*"></x-jet-label>
                                    <x-jet-input id="celular" name="celular" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('celular')" required></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <label for="chkapoderado" class="flex items-center">
                                        <x-jet-checkbox id="chkapoderado" name="chkapoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-2 py-2 rounded shadow leading-tight focus:outline-none focus:shadow-outline"></x-jet-checkbox>
                                        <span class="ml-2">De ser menor de edad por favor marcar esta opción y completar los campos.</span>
                                        <input type="hidden" name="menor" id="menor" value="0">
                                    </label>
                                    <h2 class="text-black text-lg font-bold uppercase mt-2">solo completar en caso de ser menor de edad</h2>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="tipodocumentoapoderado" value="Tipo de documento:"></x-jet-label>
                                    <select name="tipodocumentoapoderado" id="tipodocumentoapoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" disabled>
                                        <option value="">Seleccione</option>
                                        <option value="1">DNI</option>
                                        <option value="4">CARNET DE EXTRANJERIA</option>
                                        <option value="7">PASAPORTE</option>
                                    </select>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="documentoapoderado" value="Documento de identidad del padre, madre o apoderado:"></x-jet-label>
                                    <x-jet-input name="documentoapoderado" id="documentoapoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('documentoapoderado')" disabled></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="apoderado" value="Nombre y apellidos del padre, madre o apoderado:"></x-jet-label>
                                    <x-jet-input id="apoderado" name="apoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('apoderado')" disabled></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="emailapoderado" value="Correo electrónico del padre, madre o apoderado:"></x-jet-label>
                                    <x-jet-input id="emailapoderado" name="emailapoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('emailapoderado')" disabled></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <x-jet-label for="telefonoapoderado" value="Teléfono celular del padre, madre o apoderado:"></x-jet-label>
                                    <x-jet-input id="telefonoapoderado" name="telefonoapoderado" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('telefonoapoderado')" disabled></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <h2 class="text-black text-lg font-bold uppercase mt-2">detalle de la reclamación</h2>
                                </div>
                            </div>
                        </div>
                        
                        @livewire('select-concepto')

                        <div class="flex flex-wrap -m-2">
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <h2 class="text-black text-lg font-bold uppercase mt-2">por favor ingresar la información solicitada a continuación</h2>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="tipobien" value="Tipo de bien*:"></x-jet-label>
                                    <select name="tipobien" id="tipobien" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required>
                                        <option value="">Seleccione</option>
                                        <option value="P">Producto</option>
                                        <option value="S">Servicio</option>
                                    </select>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="canal" value="Canal de pedido*:"></x-jet-label>
                                    @livewire('select-canal')
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="fecha" value="Fecha de pedido*:"></x-jet-label>
                                    <x-jet-input id="fecha" name="fecha" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline" type="date" :value="old('fecha')" required></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="reclamo" value="Detalle del reclamo*:"></x-jet-label>
                                    <textarea id="reclamo" name="reclamo" rows="3" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required></textarea>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="monto" value="Monto reclamado (S/)*:"></x-jet-label>
                                    <x-jet-input id="monto" name="monto" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" type="text" :value="old('monto')" placeholder="Monto reclamado" required></x-jet-input>
                                </div>
                            </div>
                            <div class="p-2 w-full lg:w-1/2">
                                <div class="relative">
                                    <x-jet-label for="pedidocliente" value="Pedido del cliente*:"></x-jet-label>
                                    <textarea id="pedidocliente" name="pedidocliente" rows="3" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline w-full" required></textarea>
                                </div>
                            </div>
                            <div class="p-2 w-full">
                                <div class="relative">
                                    <label for="declaracion" class="flex items-center">
                                        <x-jet-checkbox id="declaracion" name="declaracion" class="block appearance-none bg-white border border-gray-400 hover:border-gray-500 px-2 py-2 rounded shadow leading-tight focus:outline-none focus:shadow-outline" required></x-jet-checkbox>
                                        <span class="ml-2">Declaro haber leido las políticas de privacidad y autorizo el tratamiento de mis datos conforme a ella (leer).</span>
                                    </label>
                                    <button class=" mt-5 rounded-full py-2 px-10 bg-red-600 text-white font-bold uppercase">enviar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</x-app-layout>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('chkapoderado').onchange = seccionapoderado;
    }, false);

    function seccionapoderado() {
        document.getElementById('tipodocumentoapoderado').disabled = !document.getElementById('tipodocumentoapoderado').disabled;
        document.getElementById('documentoapoderado').disabled = !document.getElementById('documentoapoderado').disabled;
        document.getElementById('apoderado').disabled = !document.getElementById('apoderado').disabled;
        document.getElementById('emailapoderado').disabled = !document.getElementById('emailapoderado').disabled;
        document.getElementById('telefonoapoderado').disabled = !document.getElementById('telefonoapoderado').disabled;
        if(document.getElementById('menor').value === "0"){
            document.getElementById('menor').value="1";
        }else{
            document.getElementById('menor').value="0";
        }
        
    }
</script>