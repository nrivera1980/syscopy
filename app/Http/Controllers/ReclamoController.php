<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\MOdels\libro;

class ReclamoController extends Controller
{
    public function index()
    {
        $reclamos = libro::all();

        return view('reclamos.index', compact('reclamos'));
    }
}
