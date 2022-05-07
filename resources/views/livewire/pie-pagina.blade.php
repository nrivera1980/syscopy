<div>
    <footer class="bg-red-600 relative pt-1">
        <div class="container mx-auto px-4">

            <div class="sm:flex sm:mt-8">
                <div class="mt-8 sm:mt-0 sm:w-full sm:px-8 flex flex-col md:flex-row justify-around">
                    <div class="flex flex-col">
                        <span class="mb-3 text-white text-base font-normal">Acerca de SYSCOPY</span>
                        <span class="my-1"><a href="{{route('politica')}}" class="text-white text-xs font-light no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300">Política de privacidad</a></span>
                        <span class="my-1"><a href="{{route('terminos')}}" class="text-white text-xs font-light no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300">Términos y condiciones</a></span>
                    </div>
                    <div class="flex flex-col">
                        <span class="text-white text-base font-normal mt-4 md:mt-0 mb-3">Contáctanos</span>
                        <span class="my-1 text-white text-xs font-light">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                            </svg>
                            Jr. Lampa 1170 - Cercado de Lima - Lima
                        </span>
                        <span class="my-1 text-white text-xs font-light">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                            </svg>
                            (01) 761 - 1603
                        </span>
                        <span class="my-1">
                            <a href="mailto:ventas@syscopyperu.com" class="text-white text-xs font-light no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                </svg>
                                ventas@syscopyperu.com
                            </a>
                        </span>
                    </div>
                    <div class="flex flex-col">
                        <span class="text-white text-base font-normal mt-4 md:mt-0 mb-3">Libro de reclamaciones</span>
                        <span class="my-1 text-white text-xs font-light">
                            <a href="{{route('libro-reclamaciones')}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-20 h-20 mx-auto" viewBox="0 0 24 24"><path d="M23 5v13.883l-1 .117v-16c-3.895.119-7.505.762-10.002 2.316-2.496-1.554-6.102-2.197-9.998-2.316v16l-1-.117v-13.883h-1v15h9.057c1.479 0 1.641 1 2.941 1 1.304 0 1.461-1 2.942-1h9.06v-15h-1zm-12 13.645c-1.946-.772-4.137-1.269-7-1.484v-12.051c2.352.197 4.996.675 7 1.922v11.613zm9-1.484c-2.863.215-5.054.712-7 1.484v-11.613c2.004-1.247 4.648-1.725 7-1.922v12.051z"/></svg></a>
                        </span>
                    </div>
                    <div class="flex flex-col">
                        <span class="text-white text-base font-normal mt-4 md:mt-0 mb-3">Buscar comprobante Electrónico</span>
                        <span class="my-1 text-white text-xs font-light">
                            <a href="https://n9.cl/qtdrd" target="_blank" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"> <img src="{{asset('img/sunat.png')}}" class="mx-auto h-12" alt="BUSQUEDA DE COMPROBANTE DE PAGO"> </a>
                        </span>
                    </div>
                    <div class="flex flex-col">
                        <span class="text-white text-base font-normal mt-4 md:mt-0 mb-3">Síguenos en nuestras redes</span>
                        <span class="my-1 text-white text-xs font-light mx-auto">
                            @foreach ($redes as $red)
                                @if ($red->nombre == 'whatsapp')
                                    <a target="_blank" href="{{$red->ruta}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-8 h-8 inline-block mx-3" viewBox="0 0 24 24"><path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.198-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165-.173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.075-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1.016-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.712.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/></svg></a>
                                @endif
                                @if ($red->nombre == 'facebook')
                                    <a target="_blank" href="{{$red->ruta}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-8 h-8 inline-block mx-3" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-2 10h-2v2h2v6h3v-6h1.82l.18-2h-2v-.833c0-.478.096-.667.558-.667h1.442v-2.5h-2.404c-1.798 0-2.596.792-2.596 2.308v1.692z"/></svg></a>
                                @endif
                                @if ($red->nombre == 'twitter')
                                    <a target="_blank" href="{{$red->ruta}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-8 h-8 inline-block mx-3" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6.5 8.778c-.441.196-.916.328-1.414.388.509-.305.898-.787 1.083-1.362-.476.282-1.003.487-1.564.597-.448-.479-1.089-.778-1.796-.778-1.59 0-2.758 1.483-2.399 3.023-2.045-.103-3.86-1.083-5.074-2.572-.645 1.106-.334 2.554.762 3.287-.403-.013-.782-.124-1.114-.308-.027 1.14.791 2.207 1.975 2.445-.346.094-.726.116-1.112.042.313.978 1.224 1.689 2.3 1.709-1.037.812-2.34 1.175-3.647 1.021 1.09.699 2.383 1.106 3.773 1.106 4.572 0 7.154-3.861 6.998-7.324.482-.346.899-.78 1.229-1.274z"/></svg></a>
                                @endif
                                @if ($red->nombre == 'youtube')
                                    <a target="_blank" href="{{$red->ruta}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-8 h-8 inline-block mx-3" viewBox="0 0 24 24"><path d="M16.23 7.102c-2.002-.136-6.462-.135-8.461 0-2.165.148-2.419 1.456-2.436 4.898.017 3.436.27 4.75 2.437 4.898 1.999.135 6.459.136 8.461 0 2.165-.148 2.42-1.457 2.437-4.898-.018-3.436-.271-4.75-2.438-4.898zm-6.23 7.12v-4.444l4.778 2.218-4.778 2.226zm2-12.222c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12z"/></svg></a>
                                @endif
                                @if ($red->nombre == 'instagram')
                                    <a target="_blank" href="{{$red->ruta}}" class="no-underline hover:text-yellow-300 hover:underline hover:border-yellow-300"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-8 h-8 inline-block mx-3" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.615 6h-9.23c-.766 0-1.385.62-1.385 1.384v9.23c0 .766.619 1.386 1.385 1.386h9.23c.766 0 1.385-.62 1.385-1.385v-9.23c0-.765-.619-1.385-1.385-1.385zm-4.615 3.693c1.274 0 2.309 1.032 2.309 2.307s-1.035 2.307-2.309 2.307-2.307-1.033-2.307-2.307 1.033-2.307 2.307-2.307zm4.5 6.346c0 .255-.207.461-.461.461h-8.078c-.254 0-.461-.207-.461-.461v-5.039h.949c-.045.158-.078.32-.102.486-.023.168-.038.339-.038.514 0 2.04 1.652 3.693 3.691 3.693s3.691-1.653 3.691-3.693c0-.174-.015-.346-.039-.514-.023-.166-.058-.328-.102-.486h.95v5.039zm0-6.991c0 .255-.207.462-.461.462h-1.088c-.256 0-.461-.208-.461-.462v-1.087c0-.255.205-.461.461-.461h1.088c.254 0 .461.207.461.461v1.087z"/></svg></a>
                                @endif
                            @endforeach
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mx-auto px-6">
            <div class="flex flex-col items-center">
                <div class="sm:w-2/3 py-6">
                    <p class="text-center text-white text-xs font-light">
                        SYSCOPY COPYRIGHT © 2021 - TODOS LOS DERECHOS RESERVADOS
                    </p>
                </div>
            </div>
        </div>
    </footer>
</div>
