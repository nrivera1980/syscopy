@extends('adminlte::page')

@section('title_prefix', 'PRODUCTOS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear producto</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($producto, ['route' => ['admin.productos.update', $producto], 'autocomplete' => 'off', 'files' => true, 'method' => 'put']) !!}

                <div class="form-group">
                    {!! Form::label('nombre', 'Nombre') !!}
                    {!! Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del producto', 'required' => 'required', 'autofocus']) !!}
                </div>

                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('descripcion', 'Descripción') !!}
                    {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion del producto']) !!}
                </div>

                @error('descripcion')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('detalles', 'Detalle') !!}
                    {!! Form::textarea('detalles', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion de producto']) !!}
                </div>

                @error('detalles')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="row mb-3">
                    <div class="col">
                        <div class="image-wrapper">
                            @if ($producto->imagen)
                                <img id="picture" src="{{Storage::url($producto->imagen)}}">
                            @else
                                <img id="picture" src="https://cdn.pixabay.com/photo/2014/03/25/16/54/photocopier-297547_960_720.png">
                            @endif
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {!! Form::label('imagen', 'Imagen que se mostrará en el catálogo') !!}
                            {!! Form::file('imagen', ['class' => 'form-control-file', 'accept' => 'image/*']) !!}
                            @error('imagen')
                                <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    {!! Form::label('categoria_id', 'Categoria') !!}
                    <select class="form-control" name="categoria_id" id="categoria_id">
                        <option>Seleccione</option>
                        @foreach($select as $cat)
                            {{-- @if ($producto->categoria_id !== $cat->id) --}}
                                <option value="{{ $cat->id }}" {{ old('categoria_id', $producto->categoria_id) == $cat->id ? 'selected' : '' }}>{{ $cat->nombre }}</option>
                                @foreach($cat->subcategorias as $subCategoria)
                                    {{-- @if ($producto->categoria_id !== $subCategoria->id) --}}
                                        <option value="{{ $subCategoria->id }}" {{ old('categoria_id', $producto->categoria_id) == $subCategoria->id ? 'selected' : '' }}>&#8212;>{{ $subCategoria->nombre }}</option>
                                        @foreach ($subCategoria->sub2categorias as $sub2Categoria)
                                            {{-- @if ($producto->categoria_id !== $sub2Categoria->id) --}}
                                                <option value="{{ $sub2Categoria->id }}" {{ old('categoria_id', $producto->categoria_id) == $sub2Categoria->id ? 'selected' : '' }}>&#8212;&#8212;>{{ $sub2Categoria->nombre }}</option>
                                                @foreach ($sub2Categoria->sub3categorias as $sub3Categoria)
                                                    {{-- @if ($producto->categoria_id !== $sub3Categoria->id) --}}
                                                        <option value="{{ $sub3Categoria->id }}" {{ old('categoria_id', $producto->categoria_id) == $sub3Categoria->id ? 'selected' : '' }}>&#8212;&#8212;&#8212;>{{ $sub3Categoria->nombre }}</option>
                                                    {{-- @endif --}}
                                                @endforeach
                                            {{-- @endif --}}
                                        @endforeach
                                    {{-- @endif --}}
                                @endforeach
                            {{-- @endif --}}
                        @endforeach
                    </select>
                </div>

                @error('categoria_id')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['1' => 'ACTIVO', '0' => 'INACTIVO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                </div>

                @error('estado')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('facebook', 'Enlace de facebook') !!}
                    {!! Form::text('facebook', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el enlace en Facebook del producto']) !!}
                </div>

                @error('facebook')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('compartir', 'Enlace para compartir en correo') !!}
                    {!! Form::text('compartir', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el enlace para compartir por email']) !!}
                </div>

                @error('compartir')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! form::submit('Actualizar producto', ['class' => 'btn btn-primary']) !!}
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

        CKEDITOR.replace( 'descripcion' );

        CKEDITOR.replace( 'detalles' );
        
    </script>
@endsection
