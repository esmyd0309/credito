<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Model;

class MenuRol extends Model
{
    protected $table = "menu_rol";
   // protected $fillable = ['nombre','url','icono'];
    protected $guarded =  ['id'];
    public $timestamps = false;
}
