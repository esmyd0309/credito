<?php

namespace App\Models\Proceso;

use Illuminate\Database\Eloquent\Model;
//use App\Models\Admin\DetalleCampania;
use App\Models\Admin\DetallePago;
use App\User;

class Cuotas extends Model
{
    protected $primaryKey = 'id';
    protected $table = '_cuotas';
    protected $fillable = ['ventas_id','cliente_id','saldo_abono','estado_abono', 'periodo', 'interes', 'cuota', 'abono', 'fecha_pago', 'user_id'];
    //public $timestamps = false;


   /* public function detalleCampania()
    {
    	return $this->belongsTo(DetalleCampania::class, 'detalle_campania_id');
    } */


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    } 

   	public function detallePagos ()
    {
        return $this->hasMany(DetallePago::class, 'pago_id');
    }



    public function scopeCampania($query, $id)
    {
        if (trim($id) != "") 
        {
            $query->where('campania_idc', '=', $id);
        }
    }
}
