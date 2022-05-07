<x-app-layout>
    <div>
        <div class="mx-auto">

            <div>
                <div class="slider w-full">
                    @php
                        $cnt=0;
                    @endphp
                    @foreach ($sliders as $slider)
                        @if ($cnt == 0)
                            <div class="slide active">
                                <img src="{{Storage::url($slider->imagen)}}" alt="">
                                <div class="info grid justify-items-center">
                                    <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                    <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                </div>
                            </div>
                        @else
                            <div class="slide">
                                <img src="{{Storage::url($slider->imagen)}}" alt="">
                                <div class="info grid justify-items-center">
                                    <h2 class="text-center">{!!$slider->mensaje!!}</h2>
                                    <a href="{{$slider->enlace}}" class="btn-mensaje font-bold py-2 px-4 mt-10">{{$slider->boton}}</a>
                                </div>
                            </div>
                        @endif
                        @php
                            $cnt++;
                        @endphp
                    @endforeach
                    <div class="navigation">
                        <i class="im im-angle-left prev-btn"></i>
                        <i class="im im-angle-right next-btn"></i>
                    </div>
                    <div class="navigation-visibility">
                        @for ($i = 0; $i < $cnt; $i++)
                            @if ($i == 0)
                                <div class="slide-icon active"></div>
                            @else
                                <div class="slide-icon"></div>
                            @endif

                        @endfor
                    </div>
                </div>

                <div class="container mx-auto">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5 py-10">
                        <div class="contenedor mx-auto">
                            <a href="">
                                <img class="object-contain" src="{{asset('img/icono-fotocopiadoras.png')}}" alt="">
                                <div class="overlay overlayFade">
                                    <img class="fade object-contain" src="{{asset('img/foto-fotocopiadoras.png')}}" alt="">
                                </div>
                            </a>
                        </div>
                        <div class="contenedor mx-auto">
                            <a href="">
                                <img class="object-contain" src="{{asset('img/icono-toners.png')}}" alt="">
                                <div class="overlay overlayFade">
                                    <img class="fade object-contain" src="{{asset('img/foto-toners.png')}}" alt="">
                                </div>
                            </a>
                        </div>
                        <div class="contenedor mx-auto">
                            <a href="">
                                <img class="object-contain" src="{{asset('img/icono-articulos.png')}}" alt="">
                                <div class="overlay overlayFade">
                                    <img class="fade object-contain" src="{{asset('img/foto-articulos.png')}}" alt="">
                                </div>
                            </a>
                        </div>
                        <div class="contenedor mx-auto">
                            <a href="{{route('tecnico')}}">
                                <img class="object-contain" src="{{asset('img/icono-servicio-tecnico.png')}}" alt="">
                                <div class="overlay overlayFade">
                                    <img class="fade object-contain" src="{{asset('img/foto-servicio-tecnico.png')}}" alt="">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="container mx-auto">
                    <div class="flex justify-around items-center h-32 sm:h-40 lg:h-52 bg-cover bg-center text-3xl lg:text-5xl font-bold text-red-600" style="background-image: url({{asset('img/trama.png')}})">
                        <div>─────</div>
                        <div>Marcas</div>
                        <div>─────</div>
                    </div>
                </div>

                <section>
                    <div class="flex justify-around items-center max-w-7xl mx-auto">
                        <div class="my-20 h-96 w-full flex flex-col justify-center items-center">
                            <div class="w-11/12 relative overflow-x: hidden; flex">
                                <div class="flex flex-wrap content-center nav"><button class="left2" style="outline: none"><p class="text-red-700 text-7xl font-bold"><</p></button></div>
                                <div id="showcase2" class="noselect">
                                    <a href="#"><img class="cloud9-item" src="{{asset('img/canon.png')}}" alt="Canon"></a>
                                    <a href="#"><img class="cloud9-item" src="{{asset('img/ricoh.png')}}" alt="Ricoh"></a>
                                    <a href="#"><img class="cloud9-item" src="{{asset('img/konica.png')}}" alt="Konica Minolta"></a>
                                    <a href="#"><img class="cloud9-item" src="{{asset('img/keyocera.png')}}" alt="Keyocera"></a>
                                </div>
                                <div class="flex flex-wrap content-center nav"><button class="right2" style="outline: none"><p class="text-red-700 text-7xl font-bold">></p></button></div>
                            </div>
                            <p id="item-title2" class="text-red-700 text-2xl font-bold underline uppercase">&nbsp;</p>
                        </div>
                    </div>
                </section>

            </div>

        </div>
    </div>
    {{-- inicio de los scripts --}}

</x-app-layout>
<style>
    .contenedor {
        position: relative;
        display: inline-block;
    }
    .overlay {
        position: absolute;
        transition: all .3s ease;
        opacity: 0;
        background-color: #fff;
    }
    .contenedor:hover .overlay {
        opacity: 1;
    }
    .fade {
        position: absolute;
    }
    .overlayFade {
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;

    }
</style>
<script>
    const slider = document.querySelector(".slider");
    const nextBtn = document.querySelector(".next-btn");
    const prevBtn = document.querySelector(".prev-btn");
    const slides = document.querySelectorAll(".slide");
    const slideIcons = document.querySelectorAll(".slide-icon");
    const numberOfSlides = slides.length;
    var slideNumber = 0;

    //image slider next button
    nextBtn.addEventListener("click", () => {
        slides.forEach((slide) => {
            slide.classList.remove("active");
        });
        slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
        });

        slideNumber++;

        if(slideNumber > (numberOfSlides - 1)){
            slideNumber = 0;
        }

        slides[slideNumber].classList.add("active");
        slideIcons[slideNumber].classList.add("active");
    });

    //image slider previous button
    prevBtn.addEventListener("click", () => {
        slides.forEach((slide) => {
            slide.classList.remove("active");
        });
        slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
        });

        slideNumber--;

        if(slideNumber < 0){
            slideNumber = numberOfSlides - 1;
        }

        slides[slideNumber].classList.add("active");
        slideIcons[slideNumber].classList.add("active");
    });

    //image slider autoplay
    var playSlider;

    var repeater = () => {
        playSlider = setInterval(function(){
            slides.forEach((slide) => {
            slide.classList.remove("active");
            });
            slideIcons.forEach((slideIcon) => {
            slideIcon.classList.remove("active");
            });

            slideNumber++;

            if(slideNumber > (numberOfSlides - 1)){
            slideNumber = 0;
            }

            slides[slideNumber].classList.add("active");
            slideIcons[slideNumber].classList.add("active");
        }, 4000);
    }
    repeater();

    //stop the image slider autoplay on mouseover
    slider.addEventListener("mouseover", () => {
        clearInterval(playSlider);
    });

    //start the image slider autoplay again on mouseout
    slider.addEventListener("mouseout", () => {
        repeater();
    });
</script>
