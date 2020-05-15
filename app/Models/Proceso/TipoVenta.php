<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;

class TipoVenta extends Model
{
    protected $table = "_tipoventa";
    protected $fillable = ['nombre', 'descripcion', 'porcentaje', 'created_at', 'updated_at'];
    protected $primaryKey = 'id';

}
