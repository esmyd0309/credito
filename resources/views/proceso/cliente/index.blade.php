@extends('layouts.app')
    
@section('title', 'Clientes')
@section('content')
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Clientes </h6>
      <hr>
        <div class="table-responsive">
            <cliente-component></cliente-component>
        </div>
    </div>
</div>
@endsection
@section('script')

@endsection