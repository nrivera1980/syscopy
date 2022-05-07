<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\Slider;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = Slider::all();

        return view('admin.sliders.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.sliders.create');
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
            'imagen' => 'required|image|nullable|max:2048',
            'estado' => 'required'
        ]);

        if($request->file('imagen')){

            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('slider', $request->file('imagen'), $name);

            Slider::create([
                'imagen' => $url,
                'mensaje' => $request->mensaje,
                'boton' => $request->boton,
                'enlace' => $request->enlace,
                'estado' => $request->estado
            ]);
        }

        return redirect()->route('admin.sliders.index')->with('info', 'El slider se creó con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Slider $slider)
    {
        return view('admin.sliders.show', compact('slider'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        return view('admin.sliders.edit', compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        $request->validate([
            'imagen' => 'required|image|nullable|max:2048',
            'estado' => 'required'
        ]);

        if($request->file('imagen')){
            $name = $request->file('imagen')->getClientOriginalName();

            $url = Storage::putFileAs('slider', $request->file('imagen'), $name);

            Slider::create([
                'imagen' => $url,
                'mensaje' => $request->mensaje,
                'boton' => $request->boton,
                'enlace' => $request->enlace,
                'estado' => $request->estado
            ]);
        }

        $slider->update($request->all());

        return redirect()->route('admin.sliders.index')->with('info', 'El Slider se actualizó con éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        Storage::delete($slider->imagen);

        $slider->delete();

        return redirect()->route('admin.sliders.index')->with('info', 'El slider se eliminó con éxito');
    }
}
