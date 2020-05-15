<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;
use App\Models\Proceso\Producto;

class Pagos extends Model
{
       

        protected $table = "_pagos";
        protected $fillable = ['ventas_id','clientes_id', 'fecha','agente','origen','destino','formapago','fechapago','valor','valor','archivo'];
        protected $primaryKey = 'id';

       
}
