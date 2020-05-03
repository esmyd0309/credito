@extends('layouts.app')
    
@section('title', 'Proeevedores')
@section('content')

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Proeevedores</h6>
      <a class="btn btn-success float-right" href="javascript:void(0)" id="createNewRefistro" ><i class="fas fa-user-plus"></i> </a>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        
        
            <table class="table table-bordered data-table" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Empresa</th>
                        <th>Tipo</th>
                        <th>Descripcion</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Comentario</th>

                        <th width="100px">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        
      </div>
    </div>
  </div>

<div class="modal fade" id="ajaxModel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelHeading"></h4>
            </div>
            <div class="modal-body">
                <form id="productForm" name="productForm" class="form-horizontal">
                <input type="hidden" name="id" id="id" >

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Nombre Empresa</span>
                        </div>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="" placeholder="Nombre Empresa" aria-label="Nombre Empresa" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Descripcion</span>
                        </div>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="" placeholder="Descripcion" aria-label="Descripcion" aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <label class="input-group-text" for="inputGroupSelect01">Tipo Proveedores</label>
                        </div>
                        <select class="custom-select" id="tipo" name="tipo" value="" required autofocus>
                            <option hidden selected>Seleccione...</option>
                            <option value="Fabricantes">Fabricantes</option>
                            <option value="Minoristas">Minoristas</option>
                            <option value="Mayorista">Mayorista</option>
                            <option value="Distribuidor">Distribuidor</option>
                            <option value="Importador">Importador</option>
                            <option value="Exportador">Exportador</option>
                        </select>
                      </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Dirección</span>
                        </div>
                        <input type="text" class="form-control" id="direccion" name="direccion" value="" placeholder="direccion" aria-label="Direccion" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Teléfono</span>
                        </div>
                        <input type="text" class="form-control" id="telefono" name="telefono" value="" placeholder="telefono" aria-label="Telefono" aria-describedby="basic-addon1">
                    </div>
                    
                   
                    <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Comentario</span>
                        </div>
                        <textarea class="form-control" aria-label="Comentario" id="comentario" name="comentario" value=""></textarea>
                    </div>
                    <br>
    
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary" id="saveBtn" value="create">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  


    <script type="text/javascript">
        $(function () {
            
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            var table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('proevedor.index') }}",
                columns: [
                    {data: 'id', name: 'id'},
                    {data: 'nombre', name: 'nombre'},
                    {data: 'tipo', name: 'tipo'},
                    {data: 'descripcion', name: 'descripcion'},
                    {data: 'direccion', name: 'direccion'},
                    {data: 'telefono', name: 'telefono'},
                    {data: 'comentario', name: 'comentario'},

                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ],
                language: {
                    "decimal": "",
                    "emptyTable": "No hay información",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                    "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                    "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ Entradas",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "Sin resultados encontrados",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                },
            });
            
            
            $('#createNewRefistro').click(function () {
                $('#saveBtn').val("create-product");
                $('#id').val('');
                $('#productForm').trigger("reset");
                $('#modelHeading').html("Crear nuevo Registro");
                $('#ajaxModel').modal('show');
            });
            
            $('body').on('click', '.editProeevedor', function () {
                var id = $(this).data('id');
                
                $.get("{{ route('proevedor.index') }}" +'/' + id +'/edit', function (data) {
                    
                    $('#modelHeading').html("Editar Registro");
                    $('#saveBtn').val("edit-persona");
                    $('#ajaxModel').modal('show');
                   
                    $('#id').val(data.id);
                    $('#nombre').val(data.nombre);
                    $('#descripcion').val(data.descripcion);
                    $('#tipo').val(data.tipo);
                    $('#direccion').val(data.direccion);
                    $('#telefono').val(data.telefono);
                    $('#comentario').val(data.comentario);

                })
            });


            
            $('#saveBtn').click(function (e) {
                console.log($('#productForm').serialize());
                e.preventDefault();
                $(this).html('Enviar..');
                
                $.ajax({
                    data: $('#productForm').serialize(),
                    
                    url: "{{ route('proevedor.store') }}",
                    type: "POST",
                    dataType: 'json',
                    success: function (data) {
            
                        $('#productForm').trigger("reset");
                        $('#ajaxModel').modal('hide');
                        table.draw();
                
                    },
                    error: function (data) {
                        
                    alert('ERROR.');
                        console.log('Error:', data);
                    
                        $('#saveBtn').html('Guardar');
                    }
                });
            });
            
            $('body').on('click', '.deleteProeevedor', function () {
            
                var id = $(this).data("id");
                confirm("Seguro que desea eliminar este Registro !");
                
                $.ajax({
                    type: "DELETE",
                    url: "{{ route('proevedor.store') }}"+'/'+id,
                    success: function (data) {
                        table.draw();
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });
            
        });
    
   
   </script>
@endsection