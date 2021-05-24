@extends('layouts.app')
    
@section('title', 'Ventas Reportes')
@section('content')
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Ventas Reportes </h6>
      <hr>
        <div class="table-responsive">
            <vreportes-component></vreportes-component>
        </div>
       
    </div>
</div>
@endsection
