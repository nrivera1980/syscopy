<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Tipodocumento;

class DocumentoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $documentos = Tipodocumento::all();

        return view('admin.documentos.index', compact('documentos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.documentos.create');
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
            'id' => 'required|max:2|min:1|unique:documento',
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $documento = Tipodocumento::create($request->all());

        return redirect()->route('admin.documentos.index')->with('info', 'El documento se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Tipodocumento $documento)
    {
        return view('admin.documentos.show', compact('documento'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Tipodocumento $documento)
    {
        return view('admin.documentos.edit', compact('documento'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tipodocumento $documento)
    {
        $request->validate([
            'id' => "required|max:2|min:1|unique:documento,id,$documento->id",
            'nombre' => 'required',
            'estado' => 'required'
        ]);

        $documento->update($request->all());

        return redirect()->route('admin.documentos.index')->with('info', 'El documento se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tipodocumento $documento)
    {
        $documento->delete();

        return redirect()->route('admin.documentos.index')->with('info', 'El documento se eliminó con éxito');
    }
}
