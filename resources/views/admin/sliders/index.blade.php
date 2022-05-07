@extends('adminlte::page')

@section('title_prefix', 'SLIDERS | ')

@section('Plugins.Sweetalert2')

@section('content_header')
    <h1>Lista de Sliders</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-header">
            <a class="btn btn-success" href="{{route('admin.sliders.create')}}">Agregar sliders</a>
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered" style="width:100%" id="sliders">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ruta</th>
                        <th>Mensaje</th>
                        <th>Botón</th>
                        <th>Enlace</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($sliders as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->imagen}}</td>
                            <td>{{$item->mensaje}}</td>
                            <td>{{$item->boton}}</td>
                            <td>{{$item->enlace}}</td>
                            <td>{{($item->estado == '1') ? 'ACTIVO' : 'INACTIVO'}}</td>
                            {{-- <td width="10px">
                                <a class="btn btn-primary btn-sm" href="{{route('admin.sliders.edit', $item)}}">Editar</a>
                            </td> --}}
                            <td>
                                <div class="row justify-content-center">
                                    <div>
                                        <form action="{{route('admin.sliders.destroy', $item)}}" method="POST">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-danger btn-sm" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@stop
@section('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
@endsection
@section('js')
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#sliders').DataTable({
            responsive: true,
            "language": {
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "zeroRecords": "Nada encontrado - disculpa",
                "info": "Mostrando la página _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(filtrado de from _MAX_ registros totales)",
                'search': 'Buscar:',
                'paginate': {
                    'next': 'Siguiente',
                    'previous': 'Anterior'
                }
            }
        });
    </script>
@endsection