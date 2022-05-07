<x-app-layout>
    <div>
        <div class="mx-auto">
            
            <div>
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-3xl lg:text-5xl font-bold text-red-600" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div>Nosotros</div>
                        <div>─────</div>
                    </div>
                </div>
            
                <section class="text-white font-sans bg-red-600">
                    <div class="w-4/5 px-5 py-12 mx-auto grid justify-items-center">
                        <div class="text-center mb-20 text-sm lg:text-lg">
                            <p class="w-full mb-7" style="text-align: justify; text-align-last: center;">Somos una empresa dedicada a la importación, venta mayorista y minorista de máquinas fotocopiadoras, repuestos, insumos, artículos de oficina y servicios relacionados al rubro. Con más de 12 años de experiencia y conocimiento sobre el mercado de máquinas multifuncionales, garantizamos a nuestros clientes la confianza y apoyo que necesiten al momento de comprar uno de nuestros productos. Asegurándoles que el producto que compre en nuestra tienda permitirá optimizar su produccion durante muchos años.</p>
                            <p class="w-full" style="text-align: justify; text-align-last: center;">Nuestros clientes son parte fundamental de nuestro desarrollo como empresa, por ello, nos aseguramos que nuestra atención y servicios sean los más adecuados para ustedes, y asi, volvernos su primera opción en importadoras de máquinas multifuncionales y suministros.</p>
                        </div>
                        <div class="grid gap-x-20 lg:grid-cols-2 sm:grid-cols-1 gap-y-5">
                            <div class="flex flex-col">
                                <div class="mx-auto">
                                    <img src="{{asset('img/lentes.png')}}" class="mb-10 h-28">
                                </div>
                                <div class="h-16">
                                    <p class="font-sans font-bold text-sm lg:text-4xl uppercase text-center">misión</p>
                                </div>
                                <div class="">
                                    <p class="font-sans text-sm lg:text-lg italic" style="text-align: justify; text-align-last: center;">"Ser ampliamente conocidos en el mercado de máquinas multifuncionales en Lima y provincias, siendo la primera opción de nuestros clientes más fieles. Buscamos que nuestros clientes nos recomienden por nuestros buen servicio y por nuestros productos duraderos y de alta calidad."</p>
                                </div>
                            </div>
                            <div class="flex flex-col">
                                <div class="mx-auto">
                                    <img src="{{asset('img/brujula.png')}}" class="mb-10 h-28">
                                </div>
                                <div class="h-16">
                                    <p class="font-sans font-bold text-sm lg:text-4xl uppercase text-center">visión</p>
                                </div>
                                <div>
                                    <p class="font-sans text-sm lg:text-lg italic" style="text-align: justify; text-align-last: center;">"SYCOPY PERÚ S.A.C. se posicionará en el mercado nacional como una empresa de tecnología de productos y servicios para la gestion documental, cuyo valor sea claramente perceptible por los clientes y administrada con efectivdad por equipos de profesionales de alta calidad humana, en continuo aprendizaje"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            
                <section class="bg-cover bg-center" style="background-image: url({{asset('img/networking1.png')}})">
                    <div class="flex justify-around items-center mx-auto">
                        <div class="h-96 w-full bg-blue-600 bg-opacity-75 flex flex-col justify-center items-center">
                            <div class="text-white text-2xl lg:text-4xl font-bold italic"><p class="leading-normal" style="text-align: justify; text-align-last: center;">"Una empresa diferente,<br>para un servicio eficiente"</p></div>
                            <div class="mt-8"><img src="{{asset('img/logo-02.png')}}" class="h-10"></div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
    </div>
</x-app-layout>