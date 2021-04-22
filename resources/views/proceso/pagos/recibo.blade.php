<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="{{ asset('css/bootstrap.min.css') }}"  rel="stylesheet"  >
    <style>
        * {
            font-size: 18px;
            font-family: 'DejaVu Sans', serif;
            margin: 0;
            padding: 0;
        }

       
        body {
            background: #EEE;
            font-family: sans-serif;
            
            margin: 3em;
            padding: 0;
        }
        #register {
        width: 20em;
        margin: auto;
        }
        #ticket {
        background: white;
        text-align: center;
    
        box-shadow: 0 0 5px rgba(0,0,0,.25);
        margin: 0;
        padding: 0;
        }
        #ticket h1 {
        text-align: center;
        }
        #ticket table {
        font-family: monospace;
        width: 100%;
        border-collapse: collapse;
        }
        #ticket td, #ticket th {
        padding: 5px;
        }
        #ticket th {
     
        font-size: 9px;
        }
       
        .datoscliente {
        text-align: left;
        font-family: sans-serif;
        font-size: 8px;
        padding: 5px;
        }
        .datosadicionales {
        text-align: left;
        font-family: sans-serif;
        font-size: 8px;
        padding: 5px;
        }
        #ticket td, #ticket #total {
        text-align: right;
        }
        #ticket tfoot th {
        border-top: 1px solid black;
        }

        #entry {
        background: #333;
        padding: 12px;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0,0,0,.25);
        }
        #entry input {
        width: 100%;
        padding: 10px;
        border: 1px solid black;
        text-align: right;
        font-family: sans-serif;
        font-size: 20px;
        box-shadow: inset 0 0 3px rgba(0,0,0,.5);
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        }
    </style>
</head>

<body>
<div id="register">
  <div id="ticket">
    <small>ECM</small><br>
    <small>Tecnologies</small><br>
    <small>Fortín Bloque 2 Mz. 1614 Guayaquil-Ecuador</small><br>
    <small>Telefonos: 042237750 / 0997189836</small>
    <hr>
    <div class="datoscliente">
    <small>Cliente: </small>
        @if (!empty($cliente->apellidoPaterno ))
            <small>{{ strtoupper($cliente->apellidoPaterno) }} </small>
        @endif  
        @if (!empty($cliente->apellidoMaterno )) 
            <small>{{ strtoupper($cliente->apellidoMaterno) }}</small>
        @endif  
        @if (!empty($cliente->nombre1 )) 
            <small>{{ strtoupper($cliente->nombre1) }} </small>
        @endif  
        @if (!empty($cliente->nombre2 )) 
            <small>{{ strtoupper($cliente->nombre2) }}</small>
        @endif  <br>
        @if (!empty($cliente->nombre2 )) 
        <small>Cedula: </small>
        <small>{{ strtoupper($cliente->cedula) }} </small><br>
        @endif 
        @if (!empty($pago->fecha )) 
        <small>Fecha: </small>
        <small>{{ strtoupper($pago->fecha) }} </small><br>
        @endif 
    </div>
   
    <table class="table">
      <thead>
        <tr>
            <th>Deuda</th>
            <th>Saldo Anterior</th>
            <th>Abono</th>
            <th>Saldo Actual</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <th>${{$venta->totalPagar}}</th>
            <th>${{$pago->saldo_anterior}}</th>
            <th>${{$pago->valor}}</th>
            <th>${{$venta->saldoDeuda}}</th>
        </tr>
  
        
      </tbody>
      
    </table>
    <div class="datosadicionales">
        @if (!empty($pago->formapago )) 
            <small>Forma de Pago: </small>
            <small>{{ strtoupper($pago->formapago) }} </small><br>
        @endif 
        @if (!empty($pago->documento )) 
            <small>Documento: </small>
            <small>{{ strtoupper($pago->documento) }} </small><br>
        @endif 
        @if (!empty($pago->fechapago )) 
            <small>Fecha del pago: </small>
            <small>{{ strtoupper($pago->fechapago) }} </small><br>
        @endif 
        @if (!empty($pago->tipo )) 
            <small>Tipo de pago: </small>
            @if ($pago->tipo=1) 
            <small> ABONO</small><br>
            @else
            <small> CUOTAS</small>  <br>
        
            @endif 
        @endif 
    </div>
   
  </div>
  
</div>

</html>
