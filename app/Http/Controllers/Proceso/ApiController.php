<?php

namespace App\Http\Controllers\Proceso;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Proceso\Proevedor;
use App\Models\Proceso\Categoria;
use App\Models\Proceso\Productos;
use App\Models\Proceso\Clientes;
use DB;
use DataTables;
class ApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getProeevedores(Request $request)
    {
        if ($request) 
        {
            $proeevedores = Proevedor::orderBy('id', 'asc')
                ->get();

            return response()->json($proeevedores, 200);
        }

        return response()->json([], 200);
    }

    public function getCategoria(Request $request)
    {
        if ($request) 
        {
            $categoria = Categoria::orderBy('id', 'asc')
                ->get();

            return response()->json($categoria, 200);
        }

        return response()->json([], 200);
    }


    public function getProductos(Request $request)
    {
        if ($request) 
        {
            $productos =DB::connection('mysql')
            ->table('_productos')
            ->join('_proveedor','_productos.proveedor_id','_proveedor.id')
            ->join('_categoria','_productos.categoria_id','_categoria.id')
            ->select ('_productos.*','_categoria.nombre as categoria','_proveedor.nombre as proeevedor')
            ->get();

            return response()->json($productos, 200);
        }

        return response()->json([], 200);
    }

    public function getclientes(Request $request)
    {
        if ($request) 
        {
            $clientes = Clientes::orderBy('id', 'asc')
                ->get();

            return response()->json($clientes, 200);
        }

        return response()->json([], 200);
    }

}