<x-app-layout>
    <div>
        <div class="mx-auto">

            <div>
                <div class="mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-2xl lg:text-5xl font-bold text-red-600" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div><p style="text-align: center;">Contacto</p></div>
                        <div>─────</div>
                    </div>
                </div>

                <section class="font-sans bg-white">
                    <div class="w-4/5 mx-auto grid justify-items-center">
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-y-5 gap-20">
                            <div class="flex flex-col bg-blue-800 w-full lg:w-72 lg:w-max">
                                <div class="inline-flex items-center justify-center flex-shrink-0 mt-5 mx-5">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d243.86398114182575!2d-77.03514697275698!3d-12.055648364138023!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8c78e0e513f%3A0x9c2724e098d38df2!2sSYSCOPY%20PERU!5e0!3m2!1ses!2spe!4v1622681999377!5m2!1ses!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                                <div class="flex-grow w-full mb-4">
                                    <p class="font-sans text-sm lg:text-lg text-white text-left ml-5">Jr. Lampa 1170 - Cercado de Lima - Lima</p>
                                </div>
                                <div class="grid lg:grid-cols-2 sm:grid-cols-1 gap-y-5 text-white">
                                    <div class="flex flex-col">
                                        <div class="mx-auto mb-4">
                                            <i class="im im-whatsapp"></i>
                                        </div>
                                        <div class="mx-auto mb-4 grid grid-cols-2 gap-7">
                                            <div class="mx-auto flex flex-col">
                                                <p class="font-sans text-sm lg:text-lg" style="text-align: center;">924 167 425<br>933 818 313</p>
                                            </div>
                                            <div class="mx-auto flex flex-col">
                                                <p class="font-sans text-sm lg:text-lg" style="text-align: center;">933 817 121<br>996 311 447</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex flex-col">
                                        <div class="mx-auto mb-4">
                                            <i class="im im-mail"></i>
                                        </div>
                                        <div class="mx-auto mb-4">
                                            <p class="font-sans text-sm lg:text-lg" style="text-align: center;">ventas@syscopyperu.com</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-col mx-auto my-10">
                                <h1 class="text-red-600 text-left text-3xl w-full">Hacer una consulta</h1>
                                <form action="{{route('contacto.solicitud')}}" method="POST">
                                    @csrf
                                    <div class="">
                                        <div class="mb-4 w-full">
                                            <label for="nombre">Nombre completo</label>
                                            <input type="text" id="nombre" name="nombre" class="w-full bg-white border-black focus:border-black">
                                        </div>
                                        <div class="mb-4 w-full">
                                            <label for="correo">Correo electrónico</label>
                                            <input type="email" id="correo" name="correo" class="w-full bg-white border-black focus:border-black">
                                        </div>
                                        <div class="mb-4 w-full">
                                            <label for="asunto">Asunto</label>
                                            <input type="text" id="asunto" name="asunto" class="w-full bg-white border-black focus:border-black">
                                        </div>
                                        <div class="mb-8 w-full">
                                            <label for="mensaje">Mensaje</label>
                                            <textarea name="mensaje" id="mensaje" rows="6" class="w-full bg-white border-black focus:border-black"></textarea>
                                        </div>
                                        <div class="flex justify-center">
                                            <button type="submit" class="text-white text-xl bg-blue-800 py-4 px-8 focus:outline-none">ENVIAR</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </section>

            </div>

        </div>
    </div>
</x-app-layout>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@if (!empty($msj))
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Solicitud enviada, muy pronto le responderemos, gracias.',
            showConfirmButton: false,
            timer: 3000
        })
    </script>
@endif