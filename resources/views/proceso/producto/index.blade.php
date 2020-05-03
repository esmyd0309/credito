@extends('layouts.app')
    
@section('title', 'Productos')
@section('content')
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">PRODUCTOS ACTUALES </h6>
      <hr>
        <div class="table-responsive">
            <producto-component></producto-component>
        </div>
    </div>
</div>
@endsection
@section('script')

@endsection