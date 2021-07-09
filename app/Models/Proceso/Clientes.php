<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;

class Clientes extends Model
{
    protected $table = "_clientes";
    protected $fillable = [
                            'cedula', 
                            'nombre1',
                            'nombre2',
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
                            'salario',
                            'email',
                            'nombreDocumento',
                            'documento',
                            'usuario',
                            'cargo',
                            'created_at', 
                            'updated_at'
                        ];
    protected $primaryKey = 'id';

    public function getTenantFullNameAttribute()
{
    return $this->attributes['nombre1'] .' '. $this->attributes['apellidoPaterno'];
}
}
