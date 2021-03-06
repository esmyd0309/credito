<?php

namespace App\Http\Controllers\Proceso;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Proceso\Proevedor;
use App\Models\Proceso\Categoria;
use App\Models\Proceso\Productos;
use App\Models\Proceso\Clientes;
use App\Models\Proceso\TipoVenta;
use App\Models\Proceso\Bancos;
use App\Models\Proceso\Ventas;
use App\Models\Proceso\BancosDestino;
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
       
            $clientes = Clientes::orderBy('id', 'asc')
                ->get();

            return response()->json($clientes, 200);
       
    }

    public function getclientesVentas(Request $request)
    {
       
            // $clientes = Clientes::orderBy('id', 'asc') ->get()->toArray();
            $clientes = DB::connection('mysql')->table('_clientes')
            ->select('_clientes.*',DB::raw("CONCAT(_clientes.nombre1,' ', _clientes.nombre2,' ',_clientes.apellidoPaterno,' ',_clientes.apellidoMaterno) AS nombres"))
            ->get()->toArray();
            return response()->json($clientes);
       
    }

    public function getProductosVentas(Request $request)
    {
       
            $clientes = Productos::orderBy('id', 'asc')
                ->get()->toArray();

            return response()->json($clientes);
      
    }
    public function getproducto($id)
    {
       
            $producto = Productos::where('id', $id)
                ->get()->toArray();

            return response()->json($producto);
      
    }

    public function getBancos(Request $request)
    {
        
            $bancos = Bancos::orderBy('id', 'asc')
                ->get()->toArray();

            return response()->json($bancos);
        

        return response()->json([], 200);
    }

    
    public function getBancosdestino(Request $request)
    {
        
            $bancosdestino = BancosDestino::orderBy('id', 'asc')
                ->get()->toArray();

            return response()->json($bancosdestino);
        

        return response()->json([], 200);
    }


    public function getProductosVentasPrecio($id)
    {
            $produtoPrecio = Productos::where('id',$id)->first();

            return response()->json($produtoPrecio, 200);
       
    }

    public function gettipoventa(Request $request)
    {
        if ($request) 
        {
            $tipoventa = TipoVenta::orderBy('id', 'asc')
                ->get()->toArray();

            return response()->json($tipoventa);
        }

        return response()->json([], 200);
    }
    public function getventas(Request $request)
    {
        $ventas = DB::connection('mysql')->select("SELECT 
                                                    a.id,
                                                    a.contrato,
                                                    d.nombre AS tipoventa,
                                                    b.cedula,
                                                    b.id as id_clientes,
                                                    c.nombre AS producto, 
                                                    a.valorDeuda,
                                                    a.saldoDeuda,
                                                    a.users_id, 
                                                    a.created_at AS fecha,
                                                    c.archivo,
                                                    CONCAT(b.nombre1,' ',b.nombre2,' ', b.apellidoPaterno,' ', b.apellidoMaterno) AS nombres
                                                    
                                                    FROM _ventas AS a, _clientes AS b, _productos AS c, _tipoventa AS d
                                                    WHERE 
                                                    a.cliente_id=b.id 
                                                    AND a.producto_id=c.id 
                                                    AND a.tipoVenta_id=d.id
                                                    ORDER BY a.id DESC 
                                                ");
        return response()->json($ventas, 200);
    }

    public function getventasid($id)
    {
        $ventasid = DB::connection('mysql')->select("SELECT 
                                                        a.id AS venta_id,
                                                        a.valorDeuda,
                                                        a.saldoDeuda,
                                                        a.cantidadproducto,
                                                        a.descuento,
                                                        a.interes,
                                                        a.abono,
                                                        a.totalPagar,
                                                        a.intereses,
                                                        a.adicional,
                                                        a.monto_cobrar,
                                                        a.users_id, 
                                                        a.saldo_abono, 
                                                        a.created_at AS fechacreado,
                                                        a.contrato,
                                                        d.nombre AS tipoventa,
                                                        b.cedula,
                                                        b.apellidoPaterno,
                                                        b.nombre1,
                                                        b.email,
                                                        b.documento,
                                                        b.numero,
                                                        c.nombre AS producto,
                                                        c.precio,
                                                        c.total,
                                                        c.peso, 
                                                        c.iva,
                                                        c.ice,  
                                                        c.marca, 
                                                        c.modelo, 
                                                        c.color, 
                                                        c.tamano,
                                                        c.archivo,
                                                        c.nota
                                                        
                                                        FROM _ventas AS a, _clientes AS b, _productos AS c, _tipoventa AS d
                                                        WHERE 
                                                            a.cliente_id=b.id 
                                                        AND a.producto_id=c.id 
                                                        AND a.tipoVenta_id=d.id
                                                        AND a.id=$id
                                                        

                                                ");
        return response()->json($ventasid, 200);
    }


    public function amortizaciondetalle($id)
    {
       
        $amortizaciondetalle = DB::connection('mysql')->select("SELECT * FROM _cuotas WHERE venta_id=$id");
        return response()->json($amortizaciondetalle, 200);
    }

    public function cuotaid($id)
    {
        $cuotaid = DB::connection('mysql')->select("SELECT b.* 
                                                    FROM _cuotas AS a, _cuotasdetalle AS b 
                                                    WHERE 
                                                        a.id=b.cuota_id 
                                                    AND a.venta_id=$id

                                                ");
        return response()->json($cuotaid, 200);
    }
    public function getVentastt()
    {
        $parametrosVentas = DB::connection('mysql')->select("SELECT COUNT(id) AS ventas,SUM(totalPagar)+SUM(abono) AS montos, SUM(saldoDeuda)+SUM(saldo_abono) AS porRecuperar FROM _ventas");
        return response()->json($parametrosVentas, 200);
    }

    public function ttcreditos(Request $request)
    {
        $ttcredito = DB::connection('mysql')->select("SELECT 
                                                        COUNT(id) AS cantidad,
                                                        SUM(totalPagar) AS deuda,
                                                        SUM(saldoDeuda)+SUM(saldo_abono) AS saldo,
                                                        (SUM(totalPagar)) -(SUM(saldoDeuda)+SUM(saldo_abono))   recuperado ,
                                                        (SUM(totalPagar)) -(SUM(saldoDeuda)+SUM(saldo_abono))   xrecuperar ,
                                                        SUM(devolucion) devoluciones
                                                        FROM _ventas
                                                        WHERE tipoVenta_id=1
                                                    ");
        return response()->json($ttcredito, 200);
    }

    public function ttdecontado(Request $request)
    {
        $ttdecontado = DB::connection('mysql')->select("SELECT 
                                                            COUNT(id) AS cantidad,
                                                            SUM(totalPagar)+SUM(abono) AS deuda,
                                                            SUM(saldoDeuda)+SUM(saldo_abono) AS saldo,
                                                            (SUM(totalPagar)+SUM(abono)) -(SUM(saldoDeuda)+SUM(saldo_abono))   recuperado ,
                                                            (SUM(totalPagar)+SUM(abono)) -(SUM(saldoDeuda)+SUM(saldo_abono))   xrecuperar ,
                                                            SUM(devolucion) devoluciones
                                                            FROM _ventas
                                                            WHERE tipoVenta_id=2
                                                        ");
        return response()->json($ttdecontado, 200);
    }

    public function reporteVentas(Request $request)
    {
        $reporteVentas = DB::connection('mysql')->select("SELECT 
                                                            COUNT(id) AS cantidad,
                                                            SUM(totalPagar) AS deuda,
                                                            SUM(saldoDeuda)+SUM(saldo_abono) AS saldo,
                                                            SUM(totalPagar) -(SUM(saldoDeuda)+SUM(saldo_abono))   recuperado ,
                                                            SUM(devolucion) devoluciones
                                                                FROM _ventas
                                                                
                                                    ");
        return response()->json($reporteVentas, 200);
    }

    public function reporteVentasIndicador(Request $request)
    {
        $reporteVentas = DB::connection('mysql')->select("SELECT 
                                                            COUNT(id) AS cantidad,
                                                            SUM(totalPagar) AS deuda,
                                                            SUM(saldoDeuda)+SUM(saldo_abono) AS saldo,
                                                            SUM(totalPagar) -(SUM(saldoDeuda)+SUM(saldo_abono))   recuperado ,
                                                            SUM(devolucion) devoluciones,
                                                                DATE_FORMAT(updated_at, '%d  %M  %Y')  fecha
                                                                FROM _ventas
                                                                GROUP BY DATE_FORMAT(updated_at, '%d  %M  %Y')  
                                                    ");
        return response()->json($reporteVentas, 200);
    }


    public function getPagoschart(Request $request)
    {
        $getPagoschart = DB::connection('mysql')->select("SELECT SUM(valor) AS valor,  DATE_FORMAT(created_at, '%d  %M  %Y') AS fecha FROM _pagos 
          GROUP BY DATE_FORMAT(created_at, '%d  %M  %Y')  
                                                    ");
        return response()->json($getPagoschart, 200);
    }

    public function getFormaspagochart(Request $request)
    {
        $getFormaspagochart = DB::connection('mysql')->select("SELECT SUM(valor) AS valor,formapago FROM _pagos 
        GROUP BY formapago
                                                    ");
        return response()->json($getFormaspagochart, 200);
    }

    
    public function getVentaschart(Request $request)
    {
        $getVentaschart = DB::connection('mysql')->select("
                                                                        
                                                                SELECT 
                                                                COUNT(id) AS cantidad,
                                                                SUM(totalPagar)+SUM(abono) AS deuda,
                                                                SUM(saldoDeuda)+SUM(saldo_abono) AS saldo,
                                                                (SUM(totalPagar)+SUM(abono)) -(SUM(saldoDeuda)+SUM(saldo_abono))   recuperado ,
                                                                (SUM(totalPagar)+SUM(abono)) -(SUM(saldoDeuda)+SUM(saldo_abono))   xrecuperar ,
                                                                SUM(devolucion) devoluciones,
                                                                DATE_FORMAT(created_at, '%d  %M  %Y') AS fecha
                                                                FROM _ventas
                                                                GROUP BY fecha
                                                    ");
        return response()->json($getVentaschart, 200);
    }

    public function getpagosTT(Request $request)
    {
        $getpagosTT = DB::connection('mysql')->select("
                                                                        
        SELECT SUM(valor) AS valor, COUNT(id) AS cantidad,COUNT(DISTINCT(ventas_id)) AS ventasPagos  
        FROM _pagos 
                                                    ");
        return response()->json($getpagosTT, 200);
    }

    public function getCliente($cedula)
    {

        $getCliente = Clientes::where('cedula', $cedula)
        ->get()->toArray();
      
        return response()->json($getCliente, 200);
    }

    public function deleteventa($id){
        //dd($id);
        Ventas::find($id)->delete();
     
        DB::connection('mysql')->statement("DELETE FROM _cuotasdetalle WHERE venta_id='$id'");
        DB::connection('mysql')->statement("DELETE FROM _cuotas WHERE venta_id='$id'");
        return response()->json(['success'=>'Registro Borrado.']);
    }

    public function incumplidos(){
        $incumplidos = DB::connection('mysql')->select("SELECT COUNT(ID) AS CANTIDAD,SUM(saldo_cuota) AS PENDIENTE, fecha_pago 
                                                        FROM _cuotasdetalle 
                                                        WHERE 
                                                                estado='PENDIENTE' 
                                                        AND 	fecha_pago<  CURDATE()
                                                        GROUP BY fecha_pago
                                                        ORDER BY fecha_pago DESC 
                                                    ");
        return response()->json($incumplidos, 200);
    }
    public function detalleincumplido($fecha){
        $detalleincumplido = DB::connection('mysql')->select("SELECT COUNT(a.saldo_cuota) AS cantidad, SUM(a.saldo_cuota) AS valorpendiente, c.cedula,c.numero
        FROM _cuotasdetalle  AS a, _ventas AS b, _clientes AS c
        
        WHERE 
                estado='PENDIENTE' 
        AND 	fecha_pago='$fecha'
        AND	a.venta_id=b.id
        AND 	b.cliente_id=c.id
        GROUP BY c.cedula,c.numero
        ORDER BY c.cedula DESC ");
        return response()->json($detalleincumplido, 200);
    }

    


}