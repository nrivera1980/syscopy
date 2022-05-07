<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Tienda;

class TiendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tiendas = Tienda::all();

        return view('admin.tiendas.index', compact('tiendas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.tiendas.create');
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
            'nombre' => 'required|unique:tienda',
            'empresa' => 'required|min:3',
            'ruc' => 'required|size:11',
            'direccion' => 'required',
            'estado' => 'required'
        ]);

        $tienda = Tienda::create($request->all());

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se creó con éxito');

        // return redirect()->route('admin.tiendas.edit', $tienda)->with('info', 'La tienda se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Tienda $tienda)
    {
        return view('admin.tiendas.show', compact('tienda'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Tienda $tienda)
    {
        return view('admin.tiendas.edit', compact('tienda'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tienda $tienda)
    {
        $request->validate([
            'nombre' => "required|unique:tienda,nombre,$tienda->id",
            'empresa' => 'required|min:3',
            'ruc' => 'required|size:11',
            'direccion' => 'required',
            'estado' => 'required'
        ]);

        $tienda->update($request->all());

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se actualizó con éxito');
        /*return redirect()->route('admin.tiendas.edit', $tienda)->with('info', 'La tienda se actualizó con éxito');*/
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tienda $tienda)
    {
        $tienda->delete();

        return redirect()->route('admin.tiendas.index')->with('info', 'La tienda se eliminó con éxito');
    }
}
