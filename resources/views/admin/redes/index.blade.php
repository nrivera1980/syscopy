@extends('adminlte::page')

@section('title_prefix', 'REDES SOCIALES | ')

@section('Plugins.Sweetalert2')

@endsection

@section('content_header')
    <h1>Lista de Redes sociales</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-header">
            <a class="btn btn-success" href="{{route('admin.redes.create')}}">Agregar redes sociales</a>
        </div>
        <div class="card-body">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>RUTA</th>
                        <th>ESTADO</th>
                        <th colspan="2">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($redes as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->nombre}}</td>
                            <td>{{$item->ruta}}</td>
                            <td>{{($item->estado == '1') ? 'ACTIVO' : 'INACTIVO'}}</td>
                            <td width="10px">
                                <a class="btn btn-primary btn-sm" href="{{route('admin.redes.edit', $item)}}">Editar</a>
                            </td>
                            <td width="10px">
                                <form action="{{route('admin.redes.destroy', $item)}}" method="POST">
                                    @csrf
                                    @method('delete')
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@stop
