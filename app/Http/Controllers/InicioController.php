<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Slider;
use App\Models\Producto;
use App\Models\Categoria;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Mail\ServicioTecnicoMailable;
use App\Mail\ContactenosMailable;
use Illuminate\Support\Facades\Mail;

class InicioController extends Controller
{
    public function index()
    {
        $sliders = Slider::where('estado', 1)->get();

        return view('welcome', compact('sliders'));
    }
    public function catalogo()
    {   
        $productos = Producto::with('categoria.parent.parent')
            ->take(9)
            ->paginate(9);
        
        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->orderBy('orden', 'asc')->get();
        
        return view('catalogo', compact('categorias', 'productos'));
    }

    public function deseados()
    {
        $productos = DB::table('productos')
                    ->join('wishes', function ($join) {
                            $join->on('productos.id', '=', 'wishes.productos_id')
                                ->where('wishes.users_id', '=', auth()->id());
                        })
                    ->select('productos.*')
                    ->paginate(9);

        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('btnnodeseado', 'ok');
    }

    public function producto($id)
    {
        $productos = Producto::where('categoria_id', $id)
            ->with('categoria.sub3categorias.sub3categorias')
            ->inRandomOrder()
            ->take(9)
            ->paginate(9);
        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('id', $id);
    }

    public function producto_detalle($prd)
    {
        $producto = Producto::find($prd);
        $deseado = DB::table('wishes')->where('users_id', auth()->id())->where('productos_id', $prd)->get();
       
        return view('producto', compact('producto', 'deseado'));
    }

    public function producto_deseado($prd)
    {
        $id = Auth::id();
        if($id){
            $user = User::find($id);
            $user->productos()->attach($prd);
        }

        $productos = DB::table('productos')
                    ->join('wishes', function ($join) {
                            $join->on('productos.id', '=', 'wishes.productos_id')
                                ->where('wishes.users_id', '=', auth()->id());
                        })
                    ->select('productos.*')
                    ->paginate(9);

        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('deseado', 'ok')->with('btnnodeseado', 'ok');
    }

    public function producto_nodeseo(Request $request)
    {
        $id = Auth::id();
        if($id){
            $user = User::find($id);
            $user->productos()->detach($request->id);
        }

        $productos = DB::table('productos')
                    ->join('wishes', function ($join) {
                            $join->on('productos.id', '=', 'wishes.productos_id')
                                ->where('wishes.users_id', '=', auth()->id());
                        })
                    ->select('productos.*')
                    ->paginate(9);

        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('nodeseado', 'ok')->with('btnnodeseado', 'ok');
    }

    public function search(request $request){
        $term = $request->get('term');

        $querys = Producto::where('nombre', 'LIKE', '%' . $term . '%')->get();

        $data = [];

        foreach($querys as $query){
            $data[] = [
                'label' => $query->nombre,
                'id' => $query->id
            ];
        }

        return $data;
    }

    public function enlaces($cat,$niv){
		if($niv == 1){
			$productos = DB::table('productos')
				->join('categorias as c', 'productos.categoria_id', '=', 'c.id')
				->select('productos.*')
				->where('productos.estado', 1)
				->where('c.categoria_id', $cat)
				->paginate(9);
		}elseif($niv == 3){
			$productos = DB::table('productos')
				->join('categorias as c', 'productos.categoria_id', '=', 'c.id')
				->join('categorias as cc', 'c.categoria_id', '=', 'cc.id')
				->join('categorias as ccc', 'cc.categoria_id', '=', 'ccc.id')
				->select('productos.*')
				->where('productos.estado', 1)
				->where('ccc.categoria_id', $cat)
				->paginate(9);
		}else{
			$productos = DB::table('productos')
				->join('categorias as c', 'productos.categoria_id', '=', 'c.id')
				->join('categorias as cc', 'c.categoria_id', '=', 'cc.id')
				->join('categorias as ccc', 'cc.categoria_id', '=', 'ccc.id')
				->select('productos.*')
				->where('productos.estado', 1)
				->where('ccc.categoria_id', $cat)
				->paginate(9);
		}
        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('cat', $cat);
    }
    
    /*public function enlaces($cat){
		
	    $productos = DB::table('productos')
    		->join('categorias as c', 'productos.categoria_id', '=', 'c.id')
    		->join('categorias as cc', 'c.categoria_id', '=', 'cc.id')
    		->join('categorias as ccc', 'cc.categoria_id', '=', 'ccc.id')
    		->select('productos.*')
    		->where('productos.estado', 1)
    		->where('ccc.categoria_id', $cat)
    		->paginate(9);
        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('categorias', 'productos'))->with('cat', $cat);
    }*/

    public function enlaces_marcas($mrc){
        $productos = DB::table('productos')
            ->join('categorias as c', 'productos.categoria_id', '=', 'c.id')
            ->select('productos.*')
            ->where('productos.estado', 1)
            ->where('c.categoria_id', $mrc)
            ->paginate(9);
        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();
        
        return view('catalogo', compact('categorias', 'productos'))->with('cat', $mrc);
    }

    public function servicio_tecnico(Request $request)
    {
        $correo = new ServicioTecnicoMailable($request->all());

        Mail::to('sac@syscopyperu.com')->send($correo);

        return view('tecnico')->with('msjst', 'ok');
    }

    public function contactenos(Request $request)
    {
        $correo = new ContactenosMailable($request->all());

        Mail::to('sac@syscopyperu.com')->send($correo);

        return view('contacto')->with('msj', 'ok');
    }

    public function category(Categoria $categoria, Categoria $childCategory = null, $childCategory2 = null)
    {
        $productos = null;
        $ids = collect();
        $selectedCategories = [];

        if ($childCategory2) {
            $subCategory = $childCategory->children()->where('slug', $childCategory2)->firstOrFail();
            $ids = collect($subCategory->id);
            $selectedCategories = [$categoria->id, $childCategory->id, $subCategory->id];
        } elseif ($childCategory) {
            $ids = $childCategory->children->pluck('id');
            $selectedCategories = [$categoria->id, $childCategory->id];
        } elseif ($categoria) {
            $categoria->load('children.children');
            $ids = collect();
            $selectedCategories[] = $categoria->id;

            foreach ($categoria->children as $subCategory) {
                $ids = $ids->merge($subCategory->children->pluck('id'));
            }
        }

        $productos = Producto::whereHas('categorias', function ($query) use ($ids) {
                $query->whereIn('id', $ids);
            })
            ->with('categorias.parent.parent')
            ->paginate(9);

        $categorias = Categoria::with('childrenRecursive')->whereNull('categoria_id')->get();

        return view('catalogo', compact('productos', 'selectedCategories', 'categorias'));
    }

    public function product($categoria, $childCategory, $childCategory2, $childCategory3, $productSlug, Producto $producto)
    {
        $producto->load('categorias.parent.parent.parent');
        $childCategory3 = $producto->categorias->where('slug', $childCategory3)->first();
        $selectedCategories = [];

        if ($childCategory3 &&
            $childCategory3->parent &&
            $childCategory3->parent->parent &&
            $childCategory3->parent->parent->parent
        ) {
            $selectedCategories = [
                $childCategory3->parent->parent->parent->id ?? null,
                $childCategory3->parent->parent->id ?? null,
                $childCategory3->parent->id ?? null,
                $childCategory3->id
            ];
        }

        return view('product', compact('producto', 'selectedCategories'));
    }
}
