<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Departamento;
use App\Models\Provincia;
use Illuminate\Http\Request;

class ProvinciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $provincias = Provincia::all();

        return view('admin.provincias.index', compact('provincias'));
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

        return view('admin.provincias.create', compact('select'));
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
            'nombre' => 'required|unique:provincia',
            'ubigeo' => 'required|max:2',
            'departamento_id' => 'required',
            'estado' => 'required'
        ]);

        $provincia = Provincia::create($request->all());

        return redirect()->route('admin.provincias.edit', $provincia)->with('info', 'La provincia se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Provincia $provincia)
    {
        return view('admin.provincias.show', compact('provincia'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Provincia $provincia)
    {
        $dptos = Departamento::where('estado', 1)->get();
        $select = $dptos->pluck('nombre', 'id');

        return view('admin.provincias.edit', compact('provincia', 'select'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Provincia $provincia)
    {
        $request->validate([
            'nombre' => "required|unique:provincia,nombre,$provincia->id",
            'ubigeo' => 'required|max:2',
            'departamento_id' => 'required',
            'estado' => 'required'
        ]);

        $provincia->update($request->all());

        return redirect()->route('admin.provincias.edit', $provincia)->with('info', 'La provincia se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Provincia $provincia)
    {
        $provincia->delete();

        return redirect()->route('admin.provincias.index')->with('info', 'La provincia se eliminó con éxito');
    }
}
