@if (count($datos))
<div class="table-responsive"> 
    <table class="table table-bordered table-sm">
        <thead>
            <tr>
               
                <th>id</th>
                <th>Nombre</th>
                <th>Modelo</th>
                <th>Marca</th>
                <th>Precio</th>
                <th>Fecha</th>
            </tr>
            <tbody>
                @foreach ($datos as $item)
                <tr>
                    
                    <td style="width: 10px"><a href="#" class="btn btn-sm btn-primary">{{ $item->id }}</a></td>
                    <td >{{ $item->nombre }}</td>
                    <td style="width: 10px">{{ $item->modelo }}</td>
                    <td style="width: 10px">{{ $item->marca }}</td>
                    <td style="width: 10px">${{ $item->total }}</td>
                    <td>{{ $item->created_at }}</td>
                    <td style="width: 5px"> <a href="#" class="btn btn-sm btn-info"><i class="fa fa-eye"></i></a></td>
                </tr>
                @endforeach   
            </tbody>
        </thead>
    </table>
</div> 
             
@endif