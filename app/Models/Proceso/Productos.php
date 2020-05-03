<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;
use App\Models\Proceso\Proevedor;
use App\Models\Proceso\Categoria;

class Productos extends Model
{
    
    //public $timestamps = false;

    protected $table = "_productos";
    protected $fillable = [
                            'proveedor_id', 
                            'categoria_id',
                            'nombre',
                            'descripcion',
                            'precio', 
                            'iva',
                            'ice',
                            'total',
                            'marca',
                            'modelo',
                            'color',
                            'peso',
                            'tamaño',
                            'cantidad',
                            'imagen',
                            'nota',
                            'created_at', 
                            'updated_at'
                        ];
    protected $primaryKey = 'id';

    public function categories()
    {
        return $this->belongsTo('\App\Models\Proceso\Categoria', 'categoria_id');
    }

    public function proeevedor()
    {
        return $this->belongsTo('\App\Models\Proceso\Proevedor', 'proveedor_id');
    }
}
