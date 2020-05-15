@extends('layouts.app')
    
@section('title', 'Ventas')
@section('content')
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Ventas </h6>
      <hr>
        <div class="table-responsive">
            <ventas-component></ventas-component>
        </div>
       
    </div>
</div>
@endsection
@section('script')

@endsection