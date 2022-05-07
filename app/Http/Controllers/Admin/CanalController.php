<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Canal;

class CanalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $canales = Canal::all();

        return view('admin.canales.index', compact('canales'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.canales.create');
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
            'nombre' => 'required|unique:canal',
            'estado' => 'required'
        ]);

        $canal = Canal::create($request->all());

        return redirect()->route('admin.canales.index')->with('info', 'El canal se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Canal $canale)
    {
        return view('admin.canales.show', compact('canale'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Canal $canale)
    {
        return view('admin.canales.edit', compact('canale'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Canal $canale)
    {
        $request->validate([
            'nombre' => "required|unique:canal,nombre,$canale->id",
            'estado' => 'required'
        ]);

        $canale->update($request->all());

        return redirect()->route('admin.canales.index')->with('info', 'El canal se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Canal $canale)
    {
        $canale->delete();

        return redirect()->route('admin.canales.index')->with('info', 'El canal se eliminó con éxito');
    }
}
