@extends('adminlte::page')

@section('title_prefix', 'RECLAMOS: Atender | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Atender reclamo/queja</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            {!! Form::open(['route' => 'admin.reclamos.store']) !!}

                <div class="form-group">
                    {{ Form::label('id', 'Nro. de Reclamo/queja') }}
                    {{ Form::text('id', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {{ Form::label('cliente', 'Cliente') }}
                    {{ Form::text('cliente', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {!! Form::label('detalle', 'Detalle del cliente') !!}
                    {!! Form::textarea('detalle', null, ['class' => 'form-control', 'rows' => 3, 'readonly']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('pedido', 'Pedido del cliente') !!}
                    {!! Form::textarea('pedido', null, ['class' => 'form-control', 'rows' => 3, 'readonly']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('resolucion', 'Resolución') !!}
                    {!! Form::textarea('resolucion', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => 'Ingrese una resolucion', 'autofocus']) !!}
                </div>

                @error('resolucion')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {{ Form::label('responsable', 'Responsable') }}
                    {{ Form::text('responsable', null, ['class' => 'form-control', 'placeholder' => 'Ingrese el nombre del responsable']) }}
                </div>

                @error('responsable')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('fecharspta', 'Fecha') !!}
                    {!! Form::date('fecharspta', \Carbon\Carbon::now(), ['class' => 'form-control', 'placeholder' => 'Fecha de respuesta']) !!}
                </div>

                @error('fecharspta')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['I' => 'INICIADO', 'A' => 'ATENDIDO', 'C' => 'CERRADO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                </div>

                @error('estado')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    {!! form::submit('Procesar reclamo/queja', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop
