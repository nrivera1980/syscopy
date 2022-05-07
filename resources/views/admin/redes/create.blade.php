@extends('adminlte::page')

@section('title_prefix', 'REDES SOCIALES: Crear | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Crear red social</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.redes.store']) !!}

                <div class="form-group">
                    {!! Form::label('nombre', 'Nombre') !!}
                    {!! Form::select('nombre', ['whatsapp' => 'WHATSAPP', 'facebook' => 'FACEBOOK', 'twitter' => 'TWITTER', 'instagram' => 'INSTAGRAM', 'youtube' => 'YOUTUBE'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione', 'autofocus']) !!}
                </div>

                @error('nombre')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {{ Form::label('ruta', 'Ruta') }}
                    {{ Form::text('ruta', null, ['class' => 'form-control', 'placeholder' => 'Ingrese la ruta de red social', 'autofocus']) }}
                </div>

                @error('ruta')
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
                    {!! form::submit('Crear red social', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
