<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\Producto;
use App\Models\Categoria;
use App\Models\wish;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $productos = Producto::all();

        return view('admin.productos.index', compact('productos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $select = Categoria::whereNull('categoria_id')
            ->with('subcategorias')
            ->orderByRaw('id, categoria_id, orden')
            ->get();

        return view('admin.productos.create', compact('select'));
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
            'nombre' => 'required|unique:productos',
            'descripcion' => 'required',
            'detalles' => 'required',
            'estado' => 'required',
            'imagen' => 'required|image|nullable|max:2048',
            'categoria_id' => 'required'
        ]);

        if($request->file('imagen')){
            
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('productos', $request->file('imagen'), $name);

            Producto::create([
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'detalles' => $request->detalles,
                'imagen' => $url,
                'estado' => $request->estado,
                'categoria_id' => $request->categoria_id,
                'facebook' => $request->facebook,
                'compartir' => $request->compartir
            ]);
        }

        return redirect()->route('admin.productos.index')->with('info', 'El producto se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Producto $producto)
    {
        return view('admin.productos.show', compact('producto'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Producto $producto)
    {
        $select = Categoria::whereNull('categoria_id')
            ->with('subcategorias')
            ->orderByRaw('id, categoria_id, orden')
            ->get();

        return view('admin.productos.edit', compact('producto', 'select'));
        //return $select;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Producto $producto)
    {
        $request->validate([
            'nombre' => 'required|unique:productos',
            'descripcion' => 'required',
            'detalles' => 'required',
            'estado' => 'required',
            'imagen' => 'required|mimes:jpg,jpeg,bmp,png|nullable|max:2048',
            'categoria_id' => 'required'
        ]);

        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('productos', $request->file('imagen'), $name);

            $producto->nombre = $request->nombre;
            $producto->descripcion = $request->descripcion;
            $producto->detalles = $request->detalles;
            $producto->imagen = $url;
            $producto->estado = $request->estado;
            $producto->categoria_id = $request->categoria_id;
            $producto->facebook = $request->facebook;
            $producto->compartir = $request->compartir;

            $producto->save();

        }

        return redirect()->route('admin.productos.edit', $producto)->with('info', 'El producto se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Producto $producto)
    {
        Storage::delete($producto->imagen);
        
        $deseados = wish::where('productos_id', $producto->id)->delete();

        $producto->delete();

        return redirect()->route('admin.productos.index')->with('info', 'El producto se eliminó con éxito');
    }
}
