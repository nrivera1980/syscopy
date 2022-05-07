<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Slider;

class HomeController extends Controller
{
    public function index()
    {
        $rol = Auth::user()->rol;
        $sliders = Slider::where('estado', 1)->get();

        if($rol == '1')
        {
            return view('admin.index');
        }else
        {
            return view('welcome', compact('sliders'));
        }
    }
}
