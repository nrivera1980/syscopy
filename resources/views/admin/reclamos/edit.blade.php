@extends('adminlte::page')

@section('title_prefix', 'RECLAMOS: Procesar | ')

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
            {!! Form::model($reclamo, ['route' => ['admin.reclamos.update', $reclamo], 'method' => 'put']) !!}

                <div class="form-group">
                    {{ Form::label('id', 'Nro. de Reclamo/queja') }}
                    {{ Form::text('id', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {{ Form::label('cliente', 'Cliente') }}
                    {{ Form::text('cliente', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="form-group">
                    {{ Form::label('email', 'Correo electrónico') }}
                    {{ Form::text('email', null, ['class' => 'form-control', 'readonly']) }}
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            {{ Form::label('celular', 'Celular') }}
                            {{ Form::text('celular', null, ['class' => 'form-control', 'readonly']) }}
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            {{ Form::label('telefono', 'Telefono') }}
                            {{ Form::text('telefono', null, ['class' => 'form-control', 'readonly']) }}
                        </div>
                    </div>
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
                    {!! Form::label('estado', 'Estado') !!}
                    {!! Form::select('estado', ['I' => 'INICIADO', 'A' => 'ATENDIDO', 'C' => 'CERRADO'], null, ['class' => 'form-control', 'placeholder' => 'Seleccione']) !!}
                </div>

                @error('estado')
                    <span class="text-danger">{{$message}}</span>
                @enderror

                <div class="form-group">
                    @livewire('show-respuestas', ['reclamoId' => $reclamo->id])
                </div>

                <div class="form-group">
                    {!! form::submit('Procesar reclamo/queja', ['class' => 'btn btn-primary']) !!}
                </div>

            {!! Form::close() !!}
        </div>
    </div>
@stop

@section('css')
    {{-- <link rel="stylesheet" href="/css/app.css"> --}}
@stop

@section('js')
    {{-- <script src="{{ mix('js/app.js') }}" defer></script> --}}
    <script>
        Livewire.on('alert', function(message){
            Swal.fire(
                'Buen trabajo!',
                message,
                'success'
            )
        })
    </script>
@stop
