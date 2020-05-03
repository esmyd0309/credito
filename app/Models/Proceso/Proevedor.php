<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;
use App\Models\Proceso\Producto;

class Proevedor extends Model
{
    public $timestamps = false;

    protected $table = "_proveedor";
    protected $fillable = ['nombre', 'descripcion', 'direccion', 'telefono', 'tipo','comentario', 'created_at', 'updated_at'];
    protected $primaryKey = 'id';

    public function products()
    {
        return $this->hasMany('\App\Models\Proceso\Producto');
    } 
}
