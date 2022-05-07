<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Red;

class RedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $redes = Red::all();

        return view('admin.redes.index', compact('redes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.redes.create');
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
            'nombre' => 'required|unique:redes',
            'ruta' => 'required',
            'estado' => 'required'
        ]);

        $red = Red::create($request->all());

        return redirect()->route('admin.redes.index')->with('info', 'La red social se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Red $rede)
    {
        return view('admin.redes.show', compact('rede'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Red $rede)
    {
        return view('admin.redes.edit', compact('rede'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Red $rede)
    {
        $request->validate([
            'nombre' => "required|unique:redes,nombre,$rede->id",
            'ruta' => 'required',
            'estado' => 'required'
        ]);

        $rede->update($request->all());

        return redirect()->route('admin.redes.index')->with('info', 'La red social se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Red $rede)
    {
        $rede->delete();

        return redirect()->route('admin.redes.index')->with('info', 'La red social se eliminó con éxito');
    }
}
