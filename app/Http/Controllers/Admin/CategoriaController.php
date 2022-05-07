<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Categoria;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categorias = Categoria::all();
        
        return view('admin.categorias.index', compact('categorias'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function create()
    {
        $categorias = Categoria::whereNull('categoria_id')
            ->with('subcategorias')
            ->orderByRaw('id, categoria_id, orden')
            ->get();


        //return $categorias;
        return view('admin.categorias.create', compact('categorias'));
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
            'nombre' => 'required',
            'slug' => 'required',
            'estado' => 'required',
            'orden' => 'required',
            'padre' => 'required'
        ]);

        $categoria = Categoria::create($request->all());

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Categoria $categoria)
    {
        return view('admin.categorias.show', compact('categoria'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Categoria $categoria)
    {
        /* $cat = Categoria::where([
            ['padre', 'S'],
            ['estado', 1],
        ])->get();
        $select = $cat->pluck('nombre', 'id'); */

        $select = Categoria::whereNull('categoria_id')
            ->with('subcategorias')
            ->orderByRaw('id, categoria_id, orden')
            ->get();

        return view('admin.categorias.edit', compact('categoria', 'select'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Categoria $categoria)
    {
        $request->validate([
            'nombre' => 'required',
            'slug' => 'required',
            'estado' => 'required',
            'orden' => 'required',
            'padre' => 'required'
        ]);

        $categoria->update($request->all());

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Categoria $categoria)
    {
        $categoria->delete();

        return redirect()->route('admin.categorias.index')->with('info', 'La categoría se eliminó con éxito');
    }
}
