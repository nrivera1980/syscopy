<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    {{-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> --}}
    <title>SYSCOPY: Reporte de Reclamo</title>
    <style>
        .image-wrapper {
            position: relative;
            padding-bottom: 56.25%;
        }

        .image-wrapper img {
            position: absolute;
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    @foreach ($reclamo as $item)
        <section class="container mx-auto">
            <div class="image-wrapper">
                <img src="{{asset('img/logo.png')}}">
            </div>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="30%" style="vertical-align: top; padding-top: 10px">
                        <div class="image-wrapper">
                            <img src="{{asset('img/logo.png')}}">
                        </div>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: center;">
                        <span style="font-size: 22px; font-weight: bold; color:#B91C1C;">Hoja de Reclamo/Queja Nro. {{$item->ano}}WEB-{{$item->id}}</span>
                    </td>
                </tr>
            </table>
        </section>

        <section class="container mx-auto">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr style="height: 50px">
                    <td colspan="4">
                        <p style="font-size: 16px; font-weight: bold; color:#B91C1C;">DATOS DEL PROVEEDOR</p>
                    </td>
                </tr>
                <tr style="height:30px">
                    <td>
                        <p style="font-size: 10px; color: black;">Razon Social:</p>
                        <p style="font-size: 14px; color: black;">{{$item->tienda->empresa}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">RUC:</p>
                        <p style="font-size: 14px; color: black;">{{$item->tienda->ruc}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Fecha y hora de registro:</p>
                        <p style="font-size: 14px; color: black;">{{$item->fecha}} {{$item->hora}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td colspan="3">
                        <p style="font-size: 10px; color: black;">Dirección:</p>
                        <p style="font-size: 14px; color: black;">{{$item->tienda->direccion}}</p>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr style="height: 60px">
                    <td colspan="4">
                        <p style="font-size: 16px; font-weight: bold; color:#B91C1C;">DATOS DEL CONSUMIDOR</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Nombres y apellidos:</p>
                        <p style="font-size: 14px; color: black;">{{$item->cliente}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Documento y numero:</p>
                        <p style="font-size: 14px; color: black;">{{$item->tipodocumento->nombre.' '.$item->documento}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Domicilio:</p>
                        <p style="font-size: 14px; color: black;">{{$item->domicilio}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Distrito:</p>
                        <p style="font-size: 14px; color: black;">{{$item->distrito->nombre}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Corre electrónico:</p>
                        <p style="font-size: 14px; color: black;">{{$item->email}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Celular:</p>
                        <p style="font-size: 14px; color: black;">{{$item->celular}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Teléfono:</p>
                        <p style="font-size: 14px; color: black;">{{$item->telefono}}</p>
                    </td>
                    <td></td>
                </tr>
            </table>
                @if ($item->menor == '1')
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr style="height: 60px">
                        <td colspan="4">
                            <p style="font-size: 16px; font-weight: bold; color:#B91C1C;">DATOS DEL APODERADO (MADRE O PADRE)</p>
                        </td>
                    </tr>
                    <tr style="height:50px">
                        <td>
                            <p style="font-size: 10px; color: black;">Nombres y apellidos:</p>
                            <p style="font-size: 14px; color: black;">{{$item->padre}}</p>
                        </td>
                        <td>
                            <p style="font-size: 10px; color: black;">DNI:</p>
                            <p style="font-size: 14px; color: black;">
                                @switch($item->docpadre)
                                    @case('1')
                                        {{'DNI '.$item->numpadre}}
                                        @break
                                    @case('4')
                                        {{'CARNET DE EXTRANJERIA '.$item->numpadre}}
                                        @break
                                    @case('7')
                                        {{'PASAPORTE '.$item->numpadre}}
                                        @break
                                    @default
                                        {{'NO HAY DOCUMENTO'}} 
                                @endswitch
                            </p>
                        </td>
                    </tr>
                    <tr style="height:50px">
                        <td>
                            <p style="font-size: 10px; color: black;">Teléfono:</p>
                            <p style="font-size: 14px; color: black;">{{$item->telefonopadre}}</p>
                        </td>
                        <td>
                            <p style="font-size: 10px; color: black;">correo electrónico:</p>
                            <p style="font-size: 14px; color: black;">{{$item->emailpadre}}</p>
                        </td>
                    </tr>
                </table>
                @endif
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr style="height: 60px">
                    <td colspan="4">
                        <p style="font-size: 16px; font-weight: bold; color:#B91C1C;">DATOS DEL RECLAMO/QUEJA</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Motivo:</p>
                        <p style="font-size: 14px; color: black;">
                            @switch($item->concepto->tipo)
                                @case('R')
                                    {{'RECLAMO'}}
                                    @break
                                @case('Q')
                                    {{'QUEJA'}}
                                    @break
                                @default
                                    
                            @endswitch
                        </p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Detalle:</p>
                        <p style="font-size: 14px; color: black;">{{$item->concepto->nombre}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Tipo de bien:</p>
                        <p style="font-size: 14px; color: black;">
                            @switch($item->bien)
                                @case('P')
                                    {{'PRODUCTO'}}
                                    @break
                                @case('Q')
                                    {{'QUEJA'}}
                                    @break
                                @default
                                    
                            @endswitch
                        </p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Canal:</p>
                        <p style="font-size: 14px; color: black;">{{$item->canal->nombre}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Fecha de pedido:</p>
                        <p style="font-size: 14px; color: black;">{{date('d-m-Y', strtotime($item->fechapedido))}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Monto reclamado:</p>
                        <p style="font-size: 14px; color: black;">{{number_format($item->importe, 2)}}</p>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <p style="font-size: 10px; color: black;">Detalle del reclamo:</p>
                        <p style="font-size: 14px; color: black;">{{$item->detalle}}</p>
                    </td>
                    <td>
                        <p style="font-size: 10px; color: black;">Pedido del cliente:</p>
                        <p style="font-size: 14px; color: black;">{{$item->pedido}}</p>
                    </td>
                </tr>
            </table>
        </section>
        <section class="container mx-auto">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr style="height: 60px">
                    <td colspan="4">
                        <p style="font-size: 16px; font-weight: bold; color:#B91C1C;">GESTION AL RECLAMO/QUEJA</p>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="100%" class="border-collapse border border-blue-800">
                <tr style="height: 50px">
                    <th class="border border-blue-800">Responsable</th>
                    <th class="border border-blue-800">Respuesta</th>
                    <th class="border border-blue-800">Fecha y hora</th>
                </tr>
                @foreach ($item->respuestas as $rspta)
                    <tr style="height: 50px">
                        <td class="border border-blue-800 px-4">{{$rspta->responsable}}</td>
                        <td class="border border-blue-800 px-4">{{$rspta->respuesta}}</td>
                        <td class="border border-blue-800 px-4">{{date('d-m-Y', strtotime($rspta->fecha)).' '.$rspta->hora}}</td>
                    </tr>
                @endforeach
            </table>
        </section>

    @endforeach
    
    
</body>
</html>