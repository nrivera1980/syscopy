<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Concepto;

class ConceptoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $conceptos = Concepto::all();

        return view('admin.conceptos.index', compact('conceptos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.conceptos.create');
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
            'nombre' => 'required|unique:concepto',
            'tipo' => 'required',
            'estado' => 'required'
        ]);

        $concepto = Concepto::create($request->all());

        return redirect()->route('admin.conceptos.edit', $concepto)->with('info', 'El concepto se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Concepto $concepto)
    {
        return view('admin.conceptos.show', compact('concepto'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Concepto $concepto)
    {
        return view('admin.conceptos.edit', compact('concepto'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Concepto $concepto)
    {
        $request->validate([
            'nombre' => "required|unique:concepto,nombre,$concepto->id",
            'tipo' => 'required',
            'estado' => 'required'
        ]);

        $concepto->update($request->all());

        return redirect()->route('admin.conceptos.edit', $concepto)->with('info', 'El concepto se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Concepto $concepto)
    {
        $concepto->delete();

        return redirect()->route('admin.conceptos.index')->with('info', 'El concepto se eliminó con éxito');
    }
}
