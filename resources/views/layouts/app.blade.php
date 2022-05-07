<!DOCTYPE html>
<!--
Copyright (c) 2021, Nilton Rivera. All rights reserved.
Email: nrivera.web@gmail.com
-->
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="description" content="venta impresoras multifuncional empresas hogar konica ricoh syscopyperu syscopy peru" />
        <meta name="author" content="Nilton Rivera Silva" />

        <title>{{ config('app.name', 'SYSCOPY') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ mix('css/app.css') }}">
        

        <link rel="stylesheet" href="{{asset('vendor/jquery-ui/jquery-ui.min.css')}}">

        <link rel="stylesheet" href="{{asset('vendor/fontawesome/css/all.min.css')}}">
        <link rel="stylesheet" href="{{asset('vendor/iconmonstr/css/iconmonstr-iconic-font.min.css')}}">
        <link rel="stylesheet" href="{{asset('css/main.css')}}">
        <!-- estilo para catalogo -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/daisyui@1.11.1/dist/full.css" rel="stylesheet" type="text/css" />
        
        <style>
            .alto-div{
                height:60px;
            }
        </style>
        
        @livewireStyles

        <!-- Scripts -->
        <script src="{{ mix('js/app.js') }}" defer></script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-612c2e736bf68386"></script>
    </head>
    <body class="font-mont antialiased">
        <x-jet-banner />

        <div class="min-h-screen bg-white">
            @livewire('navigation-menu')

            <!-- Page Content -->
            <main>
                {{ $slot }}
            </main>

            @livewire('pie-pagina')
        </div>

        @stack('modals')

        @livewireScripts
        <script src="{{asset('vendor/jquery/jquery-3.6.0.min.js')}}"></script>
        <script src="{{asset('vendor/jquery-ui/jquery-ui.min.js')}}"></script>
        <script src="{{asset('vendor/fontawesome/js/all.min.js')}}"></script>
    
        <script src="{{asset('js/jquery.reflection.js')}}"></script> 
        <script src="{{asset('js/jquery.cloud9carousel.js')}}"></script>
        
        <script>
            
            $('#search').autocomplete({
                source: function(request, response){
                    $.ajax({
                        url: "{{route('search.productos')}}",
                        dataType: 'json',
                        data: {
                            term: request.term
                        },
                        success: function(data){
                            response(data)
                        }
                    })
                },
                select: function(event, ui){
                    //alert(ui.item.id);
                    window.location = 'http://syscopyperu.com/catalogo/producto/' + ui.item.id;
                }
            });
            $('#search2').autocomplete({
                source: function(request, response){
                    $.ajax({
                        url: "{{route('search.productos')}}",
                        dataType: 'json',
                        data: {
                            term: request.term
                        },
                        success: function(data){
                            response(data)
                        }
                    })
                },
                select: function(event, ui){
                    window.location = 'http://syscopyperu.com/catalogo/producto/' + ui.item.id;
                }
            });
        </script>
        <script>
            $(function() {
                var showcase = $("#showcase")

                showcase.Cloud9Carousel( {
                    yPos: 42,
                    yRadius: 48,
                    mirrorOptions: {
                    gap: 12,
                    height: 0.2
                    },
                    buttonLeft: $(".nav > .left"),
                    buttonRight: $(".nav > .right"),
                    autoPlay: true,
                    bringToFront: true,
                    onRendered: showcaseUpdated,
                    onLoaded: function() {
                    showcase.css( 'visibility', 'visible' )
                    showcase.css( 'display', 'none' )
                    showcase.fadeIn( 1500 )
                    }
                } )

                function showcaseUpdated( showcase ) {
                    var title = $('#item-title').html(
                    $(showcase.nearestItem()).attr( 'alt' )
                    )

                    var c = Math.cos((showcase.floatIndex() % 1) * 2 * Math.PI)
                    title.css('opacity', 0.5 + (0.5 * c))
                }

                // Simulate physical button click effect
                $('.nav > button').click( function( e ) {
                    var b = $(e.target).addClass( 'down' )
                    setTimeout( function() { b.removeClass( 'down' ) }, 80 )
                } )

                $(document).keydown( function( e ) {
                    //
                    // More codes: http://www.javascripter.net/faq/keycodes.htm
                    //
                    switch( e.keyCode ) {
                    /* left arrow */
                    case 37:
                        $('.nav > .left').click()
                        break

                    /* right arrow */
                    case 39:
                        $('.nav > .right').click()
                    }
                } )
                })
        </script>
        <script>
            $(function() {
                var showcase = $("#showcase2")

                showcase.Cloud9Carousel( {
                    yPos: 42,
                    yRadius: 48,
                    mirrorOptions: {
                    gap: 12,
                    height: 0.2
                    },
                    buttonLeft: $(".nav > .left2"),
                    buttonRight: $(".nav > .right2"),
                    autoPlay: true,
                    bringToFront: true,
                    onRendered: showcaseUpdated,
                    onLoaded: function() {
                    showcase.css( 'visibility', 'visible' )
                    showcase.css( 'display', 'none' )
                    showcase.fadeIn( 1500 )
                    }
                } )

                function showcaseUpdated( showcase ) {
                    var title = $('#item-title2').html(
                    $(showcase.nearestItem()).attr( 'alt' )
                    )

                    var c = Math.cos((showcase.floatIndex() % 1) * 2 * Math.PI)
                    title.css('opacity', 0.5 + (0.5 * c))
                }

                // Simulate physical button click effect
                $('.nav > button').click( function( e ) {
                    var b = $(e.target).addClass( 'down' )
                    setTimeout( function() { b.removeClass( 'down' ) }, 80 )
                } )

                $(document).keydown( function( e ) {
                    //
                    // More codes: http://www.javascripter.net/faq/keycodes.htm
                    //
                    switch( e.keyCode ) {
                    /* left arrow */
                    case 37:
                        $('.nav > .left2').click()
                        break

                    /* right arrow */
                    case 39:
                        $('.nav > .right2').click()
                    }
                } )
                })
        </script>
        {{-- @yield('js') --}}
    </body>
</html>
