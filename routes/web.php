<?php

use App\Http\Controllers\LibroController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InicioController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('storage-link', function(){
    Artisan::call('storage:link');
});

Route::get('/', [InicioController::class, 'index'])->name('inicio');
/* Route::get('/', function () {
    return view('welcome');
})->name('inicio'); */

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::get('nosotros', function () {
    return view('nosotros');
})->name('nosotros');

Route::get('tecnico', function () {
    return view('tecnico');
})->name('tecnico');

Route::get('politica', function () {
    return view('politicas');
})->name('politica');

Route::get('terminos', function () {
    return view('terminos');
})->name('terminos');

Route::get('search/productos', [InicioController::class, 'search'])->name('search.productos');

Route::get('catalogo', [InicioController::class, 'catalogo'])->name('catalogo');

Route::get('catalogo/deseados', [InicioController::class, 'deseados'])->name('deseados');

Route::get('catalogo/{id}', [InicioController::class, 'producto'])->name('producto');

Route::get('catalogo/producto/{prd}', [InicioController::class, 'producto_detalle'])->name('detalle.producto');

Route::post('catalogo/deseados', [InicioController::class, 'producto_nodeseo'])->name('nodeseo.producto');

Route::get('catalogo/deseados/{id}', [InicioController::class, 'producto_deseado'])->name('deseadosxuser');

/*Route::get('catalogo/cat/{cat}', [InicioController::class, 'enlaces'])->name('catalogo.enlaces');*/

Route::get('catalogo/cat/{cat}/{niv}', [InicioController::class, 'enlaces'])->name('catalogo.enlaces');

Route::get('catalogo/mrc/{mrc}', [InicioController::class, 'enlaces_marcas'])->name('catalogo.enlaces_marcas');

Route::post('tecnico', [InicioController::class, 'servicio_tecnico'])->name('contacto.servicio');

Route::post('contacto', [InicioController::class, 'contactenos'])->name('contacto.solicitud');

Route::get('contacto', function () {
    return view('contacto');
})->name('contacto');

Route::get('libro-reclamaciones', [LibroController::class, 'create'])->name('libro-reclamaciones');

Route::post('libro-reclamaciones', [LibroController::class, 'store'])->name('libro-reclamaciones.store');

Route::get('libro-reclamaciones/{id}', [LibroController::class, 'show'])->name('libro-reclamaciones.show');

// Google login
Route::get('/auth/google', [LoginController::class, 'redirectToGoogle'])->name('login.google');
Route::get('/auth/google/callback', [LoginController::class, 'handleGoogleCallback']);

// Facebook login
Route::get('/auth/facebook', [LoginController::class, 'redirectToFacebook'])->name('login.facebook');
Route::get('/auth/facebook/callback', [LoginController::class, 'handleFacebookCallback']);