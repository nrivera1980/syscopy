@extends('adminlte::page')

@section('title_prefix', 'TIENDA: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear tienda</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.tiendas.store']) !!}

                <div class="form-group">
                    {{ Form::label('nombre', 'Nombre de la tienda') }}
                    {{ Form::text('nombre', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre de la tienda', 'autofocus']) }}
                </div>

                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {{ Form::label('empresa', 'Razón Social') }}
                    {{ Form::text('empresa', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la razon social']) }}
                </div>

                @error('empresa')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {{ Form::label('ruc', 'RUC') }}
                    {{ Form::text('ruc', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el RUC']) }}
                </div>

                @error('ruc')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {{ Form::label('direccion', 'Dirección') }}
                    {{ Form::text('direccion', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la direccion']) }}
                </div>

                @error('direccion')
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
                    {!! form::submit('Crear tienda', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
