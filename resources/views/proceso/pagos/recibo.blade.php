<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="{{ asset('css/bootstrap.min.css') }}"  rel="stylesheet"  >
    <style>
        * {
            font-size: 12px;
            font-family: 'DejaVu Sans', serif;
        }

        h1 {
            font-size: 18px;
        }

        .ticket {
            margin: 2px;
        }

        td,
        th,
        tr,
        table {
            border-top: 1px solid black;
            border-collapse: collapse;
            margin: 0 auto;
        }

        td.precio {
            text-align: right;
            font-size: 11px;
        }

        td.cantidad {
            font-size: 11px;
        }

        td.producto {
            text-align: center;
        }

        th {
            text-align: center;
        }


        .centrado {
            text-align: center;
            align-content: center;
        }

        .ticket {
            width: 180px;
            max-width: 180px;
        }

        img {
            max-width: inherit;
            width: inherit;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .ticket {
            margin: 0;
            padding: 0;
        }

        body {
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="ticket centrado">
        <h3>EMC</h3>
        <h3>Tecnologies</h3>
        <h4>Ticket # {{ $pago->id }}</h4>
        <h4>2020-02-05 00:12:22</h4>
        <?php
        # Recuerda que este arreglo puede venir de cualquier lugar; aquí lo defino manualmente para simplificar
        # Puedes obtenerlo de una base de datos, por ejemplo: https://parzibyte.me/blog/2019/07/17/php-bases-de-datos-ejemplos-tutoriales-conexion/

        $productos = [
            [
                "cantidad" => 31,
                "descripcion" => "Cheetos verdes 80 g",
                "precio" => 123,
            ],
            [
                "cantidad" => 12,
                "descripcion" => "Teclado HyperX",
                "precio" => 1233,
            ],
            [
                "cantidad" => 12,
                "descripcion" => "Mouse Logitech ASD123",
                "precio" => 841,
            ],
            [
                "cantidad" => 15,
                "descripcion" => "Monitor Samsung 123",
                "precio" => 3546,
            ],
        ];
        ?>

        <table>
            <thead>
                <tr class="centrado">
                    <th class="cantidad">CANT</th>
                    <th class="producto">PRODUCTO</th>
                    <th class="precio">$$</th>
                </tr>
            </thead>
            <tbody>
               
            </tbody>
            <tr>
                <td class="cantidad"></td>
                <td class="producto">
                    <strong>TOTAL</strong>
                </td>
                <td class="precio">
                   
                </td>
            </tr>
        </table>
        <p class="centrado">¡GRACIAS POR SU COMPRA!
            <br>parzibyte.me</p>
    </div>
    <script src="{{ asset('js/jquery.min.js') }}"></script>
</body>

</html>
