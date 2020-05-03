<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;
use App\Models\Proceso\Producto;

class Categoria extends Model
{
        public $timestamps = false;

        protected $table = "_categoria";
        protected $fillable = ['nombre', 'descripcion','nota','estado', 'created_at', 'updated_at'];
        protected $primaryKey = 'id';

        public function products()
       {
           return $this->hasMany('\App\Models\Proceso\Producto');
       }
}
