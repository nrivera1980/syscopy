@extends('adminlte::page')

@section('title_prefix', 'CATEGORIAS: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear Categoria</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.categorias.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de la categoria', 'autofocus']) }}
                </div>

                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('slug', 'Slug') !!}
                    {!! Form::text('slug', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el slug de la categoria', 'readonly']) !!}
                </div>

                @error('slug')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('descripcion', 'Descripción') !!}
                    {!! Form::textarea('descripcion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una descripcion de la categoria']) !!}
                </div>

                @error('descripcion')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('orden', 'Orden') !!}
                    {!! Form::select('orden', ['1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                </div>

                @error('orden')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('padre', 'Padre ?') !!}
                    {!! Form::select('padre', ['S' => 'SI', 'N' => 'NO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                </div>

                @error('padre')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('categoria_id', 'Categoria padre') !!}
                    {{-- {!! Form::select('categoria_id', $categorias, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!} --}}
                    <select class="form-control {{ $errors->has('category') ? 'is-invalid' : '' }}" name="categoria_id" id="categoria_id">
                        <option>Seleccione</option>
                        @foreach($categorias as $categoria)                         
                            <option value="{{ $categoria->id }}" {{ old('categoria_id') == $categoria->id ? 'selected' : '' }}>{{ $categoria->nombre }}</option>                         
                            @foreach($categoria->subcategorias as $subCategoria)
                                <option value="{{ $subCategoria->id }}" {{ old('categoria_id') == $subCategoria->id ? 'selected' : '' }}>&#8212;>{{ $subCategoria->nombre }}</option>                         
                                @foreach ($subCategoria->sub2categorias as $sub2Categoria)                                
                                    <option value="{{ $sub2Categoria->id }}" {{ old('categoria_id') == $sub2Categoria->id ? 'selected' : '' }}>&#8212;&#8212;>{{ $sub2Categoria->nombre }}</option>
                                    @foreach ($sub2Categoria->sub3categorias as $sub3Categoria)
                                        <option value="{{ $sub3Categoria->id }}" {{ old('categoria_id') == $sub3Categoria->id ? 'selected' : '' }}>&#8212;&#8212;&#8212;>{{ $sub3Categoria->nombre }}</option>    
                                    @endforeach                                    
                                @endforeach
                            @endforeach
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
                    {!! form::submit('Crear categoria', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop

@section('js')
    <script src="{{asset('vendor/jQuery-Plugin-stringToSlug-1.3/jquery.stringToSlug.min.js')}}"></script>

    <script>
        $(document).ready( function() {
            $("#nombre").stringToSlug({
                setEvents: 'keyup keydown blur',
                getPut: '#slug',
                space: '-'
            });
        });
    </script>
@endsection
