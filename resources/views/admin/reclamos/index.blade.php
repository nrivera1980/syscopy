@extends('adminlte::page')

@section('title_prefix', 'RECLAMOS | ')

@section('Plugins.Sweetalert2')

@section('content_header')
    <h1>Lista de Reclamos</h1>
@stop

@section('content')

    @if (session('info'))
        <div class="alert alert-success">
            <strong>{{session('info')}}</strong>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            <table class="table table-striped table-bordered" style="width:100%" id="reclamos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nro. RECLAMO</th>
                        <th>CLIENTE</th>
                        <th>TIPO</th>
                        <th>CONCEPTO</th>
                        <th>FECHA REG.</th>
                        <th>ESTADO</th>
                        <th>ACCION</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($reclamos as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->ano.'WEB-'.$item->id}}</td>
                            <td>{{$item->cliente}}</td>
                            <td>{{($item->concepto->tipo == 'R') ? 'RECLAMO' : 'QUEJA'}}</td>
                            <td>{{$item->concepto->nombre}}</td>
                            <td>{{$item->fecha}}</td>
                            <td>
                                @if ($item->estado == 'A')
                                    {{'ATENDIDO'}}
                                @elseif($item->estado == 'C')
                                    {{'CERRADO'}}
                                @else
                                    {{'INICIADO'}}
                                @endif
                            </td>
                            <td style="padding-left: 5px; padding-right:5px">
                                <div class="row justify-content-center">
                                    <div style="margin-right:3px">
                                        <a class="btn btn-primary btn-sm" href="{{route('admin.reclamos.edit', $item)}}">Atender</a>
                                    </div>
                                    <div>
                                        <a class="btn btn-success btn-sm" target="_blank" href="{{route('reporte.reclamo', $item->id)}}"><i class="fa fa-print"></i></a>
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
        $('#reclamos').DataTable({
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