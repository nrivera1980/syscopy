@extends('adminlte::page')

@section('title_prefix', 'USUARIOS: Cambiar rol | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Cambiar rol de usuario</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::model($usuario, ['route' => ['admin.usuarios.update', $usuario], 'method' => 'put']) !!}

                <div class="form-group">
                    {{ Form::label('name', 'Nombres y apellidos') }}
                    {{ Form::text('name', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {{ Form::label('email', 'Email') }}
                    {{ Form::text('email', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {{ Form::label('login', 'Nombre de usuario') }}
                    {{ Form::text('login', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {!! Form::label('rol', 'Estado') !!}
                    {!! Form::select('rol', ['1' => 'ADMINISTRADOR', '0' => 'USUARIO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione', 'autofocus']) !!}
                </div>

                @error('estado')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! form::submit('Actualizar rol', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
