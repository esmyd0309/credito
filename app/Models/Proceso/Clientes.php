<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;

class Clientes extends Model
{
    protected $table = "_clientes";
    protected $fillable = [
                            'cedula', 
                            'nombre_1',
                            'nombre_2',
                            'apellidoPaterno',
                            'apellidoMaterno', 
                            'fechaNacimiento',
                            'prefijo',
                            'numero',
                            'telefonoConvencional',
                            'prefijotrabajo',
                            'telefonoTrabajo',
                            'extension',
                            'direccionDomicilio',
                            'direccionTrabajo',
                            'nombreEmpresa',
                            'cargo',
                            'created_at', 
                            'updated_at'
                        ];
    protected $primaryKey = 'id';
}
