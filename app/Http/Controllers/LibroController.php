<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\libro;

use App\Mail\ReclamacionesMailable;
use Illuminate\Support\Facades\Mail;

//use PHPMailer\PHPMailer\PHPMailer;
//use PHPMailer\PHPMailer\Exception;

class LibroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('reclamos');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('reclamos');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $libro = new libro();

        $libro->fecha = $request->fecharegistro;
        $libro->hora = $request->horaregistro;
        $libro->documento = $request->documento;
        $libro->cliente = $request->cliente;
        $libro->domicilio = $request->domicilio;
        $libro->email = $request->email;
        $libro->celular = $request->celular;
        $libro->telefono = $request->telefono;
        $libro->menor = $request->menor;
        $libro->docpadre = $request->tipodocumentoapoderado;
        $libro->numpadre = $request->documentoapoderado;
        $libro->padre = $request->apoderado;
        $libro->emailpadre = $request->emailapoderado;
        $libro->telefonopadre = $request->telefonoapoderado;
        $libro->bien = $request->tipobien;
        $libro->fechapedido = $request->fecha;
        $libro->detalle = $request->reclamo;
        $libro->importe = $request->monto;
        $libro->pedido = $request->pedidocliente;
        $libro->estado = 'I';
        $libro->distrito_id = $request->distrito;
        $libro->canal_id = $request->canal;
        $libro->concepto_id = $request->detalle;
        $libro->tienda_id = $request->tienda;
        $libro->documento_id = $request->tipodocumento;
        $libro->ano = date('Y');

        $libro->save();

        $correo = new ReclamacionesMailable($libro);

        Mail::to($request->email)->cc('sac@syscopyperu.com')->send($correo);

        return redirect()->route('libro-reclamaciones.show', $libro);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $libro = libro::find($id);

        return view('confirmacion', compact('libro'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Libro $libro)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Libro $libro)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Libro $libro)
    {
        //
    }
}
