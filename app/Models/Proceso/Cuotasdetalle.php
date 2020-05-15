<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;

class Cuotasdetalle extends Model
{
    //public $timestamps = false;
    protected $table ='_cuotasdetalle';
    protected $fillable = [
                            'cuota_id',
                            'periodo', 
                            'saldo_inicial',
                            'interes',
                            'cuota',
                            'abono',
                            'fecha_pago',
                            'saldo_final',
                            'asesor',
                            'fecha_registro',
                            'estado',
                            ];
}
