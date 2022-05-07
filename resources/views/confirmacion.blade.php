<x-app-layout>
    <div>
        <div class="mx-auto">
            <div>
                <section class="text-black font-sans bg-white">
                    <div class="container px-5 py-10 mx-auto text-sm lg:text-base">
                        <div class="text-justify">
                            <h2 class="text-red-600 text-lg font-bold mb-5 uppercase">registro de su queja o reclamo realizado con exito.</h2>
                            <p class="w-full mb-5 font-bold">Sr(a). {{$libro->cliente}}</p>
                            <p class="w-full mb-5">Se le informa que su queja o reclamo ha sido registro y adicional a esto se ha enviado un correo de confirmación a la siguiente direcion de email proporcionado por Ud. {{$libro->email}}</p>
                            <p class="w-full font-bold">Por tanto, se le estara respondiendo en los 30 dias calendario sobre la solución a su reclamo o queja.</p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</x-app-layout>
