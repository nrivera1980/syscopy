<?php

use App\Http\Controllers\Admin\CategoriaController;
use App\Http\Controllers\Admin\CanalController;
use App\Http\Controllers\Admin\ConceptoController;
use App\Http\Controllers\Admin\DepartamentoController;
use App\Http\Controllers\Admin\ProvinciaController;
use App\Http\Controllers\Admin\DistritoController;
use App\Http\Controllers\Admin\DocumentoController;
use App\Http\Controllers\Admin\TiendaController;
use App\Http\Controllers\Admin\RedController;
use App\Http\Controllers\Admin\ProductoController;
use App\Http\Controllers\Admin\ReclamoController;
use App\Http\Controllers\Admin\UsuarioController;
use App\Http\Controllers\Admin\MarcaController;
use App\Http\Controllers\Admin\ReclamoPdfController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;


Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->get('/', [HomeController::class, 'index'])->name('admin.home');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->get('/reporte/{id}', [ReclamoPdfController::class, 'downloadPDF'])->name('reporte.reclamo');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('categorias', CategoriaController::class)->names('admin.categorias');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('canales', CanalController::class)->names('admin.canales');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('conceptos', ConceptoController::class)->names('admin.conceptos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('departamentos', DepartamentoController::class)->names('admin.departamentos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('provincias', ProvinciaController::class)->names('admin.provincias');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('distritos', DistritoController::class)->names('admin.distritos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('documentos', DocumentoController::class)->names('admin.documentos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('redes', RedController::class)->names('admin.redes');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('tiendas', TiendaController::class)->names('admin.tiendas');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('productos', ProductoController::class)->names('admin.productos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('usuarios', UsuarioController::class)->names('admin.usuarios');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('reclamos', ReclamoController::class)->names('admin.reclamos');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('marcas', MarcaController::class)->names('admin.marcas');

Route::middleware(['auth:sanctum', 'verified', 'verifyrole'])->resource('sliders', SliderController::class)->names('admin.sliders');
