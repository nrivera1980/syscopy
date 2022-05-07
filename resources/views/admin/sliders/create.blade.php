@extends('adminlte::page')

@section('title_prefix', 'SLIDERS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear slider</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.sliders.store', 'autocomplete' => 'off', 'files' => true]) !!}

                <div class="form-group">
                    {!! Form::label('mensaje', 'Mensaje con formato Html') !!}
                    {!! Form::textarea('mensaje', null, ['class' => 'form-control', 'autofocus']) !!}
                    @error('mensaje')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            <img id="picture" src="https://cdn.pixabay.com/photo/2021/06/28/10/15/coffee-6371149_960_720.jpg" alt="">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('imagen', 'Imagen que se mostrará en el Slider') !!}
                            {!! Form::file('imagen', ['class' => 'form-control-file textoBase', 'accept' => 'image/*']) !!}
                            @error('imagen')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                        <span style="color: #f83636">Importante:</span> Antes de subir la imagen, debera de renombrar a la imagen con un nombre enumerado, por ejemplo: " 1.jpg o 1.png", ademas solo puede albergar cinco imagenes como maximo y las dimensiones de la imagen a subir debera de ser como minimo de 1583 pixeles de ancho y 530 pixeles de alto.
                    </div>
                </div>

                <div class="form-group">
                    {!! Form::label('boton', 'Nombre del Boton') !!}
                    {!! Form::text('boton', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del boton']) !!}
                    @error('boton')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! Form::label('enlace', 'Enlace del Boton') !!}
                    {!! Form::text('enlace', null, ['class' => 'form-control', 'placeholder' => 'Ejemplo: http://mipagina.com/seccion']) !!}
                    @error('enlace')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                    @error('estado')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    {!! form::submit('Crear slider', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop

@section('css')
    <style>
        .image-wrapper {
            position: relative;
            padding-bottom: 56.25%;
        }

        .image-wrapper img {
            position: absolute;
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

    </style>
@stop

@section('js')
    <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>

    <script>

        document.getElementById("imagen").addEventListener('change', cambiarImagen);

        function cambiarImagen(event){
            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = (event) => {
                document.getElementById("picture").setAttribute('src', event.target.result);
            };

            reader.readAsDataURL(file);
        }

        CKEDITOR.replace( 'mensaje' );
    
    </script>
@stop
