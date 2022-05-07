<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\Distrito;

class DistritoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $distritos = Distrito::all();

        return view('admin.distritos.index', compact('distritos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $dptos = Departamento::where('estado', 1)->get();
        $select = $dptos->pluck('nombre', 'id');

        return view('admin.distritos.create', compact('select'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|unique:distrito',
            'ubigeo' => 'required|max:2',
            'provincia_id' => 'required',
            'estado' => 'required'
        ]);

        $distrito = Distrito::create($request->all());

        return redirect()->route('admin.distritos.index')->with('info', 'El distrito se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Distrito $distrito)
    {
        return view('admin.distritos.show', compact('distrito'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Distrito $distrito)
    {
        $dptos = Departamento::where('estado', 1)->get();
        $select = $dptos->pluck('nombre', 'id');

        $provs = Provincia::where('estado', 1)->get();
        $select2 = $provs->pluck('nombre', 'id');

        return view('admin.distritos.edit', compact('distrito', 'select', 'select2'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Distrito $distrito)
    {
        $request->validate([
            'nombre' => "required|unique:distrito,nombre,$distrito->id",
            'ubigeo' => 'required|max:2',
            'provincia_id' => 'required',
            'estado' => 'required'
        ]);

        $distrito->update($request->all());

        return redirect()->route('admin.distritos.index')->with('info', 'El distrito se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Distrito $distrito)
    {
        $distrito->delete();

        return redirect()->route('admin.distritos.index')->with('info', 'El distrito se eliminó con éxito');
    }
}
