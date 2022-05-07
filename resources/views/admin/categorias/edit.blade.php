@extends('adminlte::page')

@section('title_prefix', 'CATEGORIAS: Editar | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Editar Categoria</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($categoria, ['route' => ['admin.categorias.update', $categoria], 'method' => 'put']) !!}

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
                    {{-- {!! Form::select('categoria_id', $select, null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!} --}}
                    <select class="form-control" name="categoria_id" id="categoria_id">
                        <option>Seleccione</option>
                        @foreach($select as $cat)
                            {{-- @if ($categoria->id !== $cat->id) --}}
                                <option value="{{ $cat->id }}" {{ old('categoria_id', $categoria->categoria_id) == $cat->id ? 'selected' : '' }}>{{ $cat->nombre }}</option>
                                @foreach($cat->subcategorias as $subCategoria)
                                    {{-- @if ($categoria->id !== $subCategoria->id) --}}
                                        <option value="{{ $subCategoria->id }}" {{ old('categoria_id', $categoria->categoria_id) == $subCategoria->id ? 'selected' : '' }}>&#8212;>{{ $subCategoria->nombre }}</option>
                                        @foreach ($subCategoria->sub2categorias as $sub2Categoria)
                                            {{-- @if ($categoria->id !== $sub2Categoria->id) --}}
                                                <option value="{{ $sub2Categoria->id }}" {{ old('categoria_id', $categoria->categoria_id) == $sub2Categoria->id ? 'selected' : '' }}>&#8212;&#8212;>{{ $sub2Categoria->nombre }}</option>
                                                @foreach ($sub2Categoria->sub3categorias as $sub3Categoria)
                                                    {{-- @if ($categoria->id !== $sub3Categoria->id) --}}
                                                        <option value="{{ $sub3Categoria->id }}" {{ old('categoria_id', $categoria->categoria_id) == $sub3Categoria->id ? 'selected' : '' }}>&#8212;&#8212;&#8212;>{{ $sub3Categoria->nombre }}</option>
                                                    {{-- @endif --}}
                                                @endforeach
                                            {{-- @endif                                 --}}
                                        @endforeach
                                    {{-- @endif --}}
                                @endforeach
                            {{-- @endif --}}
                        @endforeach
                    </select>

                    {{-- <select class="form-control select2 {{ $errors->has('category') ? 'is-invalid' : '' }}" name="category_id" id="category_id">
                        <option value="">{{ trans('global.pleaseSelect') }}</option>
                        @foreach($categories as $category)
                            @if($productCategory->id !== $category->id)
                                <option value="{{ $category->id }}" {{ old('category_id', $productCategory->category_id) == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                                @foreach($category->childCategories as $childCategory)
                                    @if($productCategory->id !== $childCategory->id)
                                        <option value="{{ $childCategory->id }}" {{ old('category_id', $productCategory->category_id) == $childCategory->id ? 'selected' : '' }}>-- {{ $childCategory->name }}</option>
                                    @endif
                                @endforeach
                            @endif
                        @endforeach
                    </select> --}}
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
                    {!! form::submit('Actualizar categoria', ['class' => 'btn btn-primary']) !!}
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
