@extends('layouts.app')
    
@section('title', 'inicio')
@section('content')

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Categorias</h6>
      <a class="btn btn-success float-right" href="javascript:void(0)" id="createNewRefistro" ><i class="fas fa-dolly"></i> </a>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        
        
            <table class="table table-bordered data-table" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Nota</th>
                        <th>Estado</th>
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
                        <span class="input-group-text" id="basic-addon1">Nombre</span>
                        </div>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="" placeholder="Nombre de la categoria" aria-label="Nombre Empresa" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Descripcion</span>
                        </div>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="" placeholder="Descripcion" aria-label="Descripcion" aria-describedby="basic-addon1">
                    </div>
                   
                    <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Nota</span>
                        </div>
                        <textarea class="form-control" aria-label="Nota" id="nota" name="nota" value=""></textarea>
                    </div>
                    <br>
                    <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="customControlValidation1" name="estado" required>
                            <label class="custom-control-label" for="customControlValidation1">Estado</label>
                        <div class="invalid-feedback">Activo / Desactivado</div>
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
                ajax: "{{ route('categorias.index') }}",
                columns: [
                    {data: 'id', name: 'id'},
                    {data: 'nombre', name: 'nombre'},
                    {data: 'descripcion', name: 'descripcion'},
                    {data: 'nota', name: 'nota'},
                    {data: 'estado', name: 'customControlValidation1'},
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
                
                $.get("{{ route('categorias.index') }}" +'/' + id +'/edit', function (data) {
                    
                    $('#modelHeading').html("Editar Registro");
                    $('#saveBtn').val("edit-persona");
                    $('#ajaxModel').modal('show');
                   
                    $('#id').val(data.id);
                    $('#nombre').val(data.nombre);
                    $('#descripcion').val(data.descripcion);
                    $('#customControlValidation1').val(data.estado);
                    $('#nota').val(data.nota);

                })
            });


            
            $('#saveBtn').click(function (e) {
                console.log($('#productForm').serialize());
                e.preventDefault();
                $(this).html('Enviar..');
                
                $.ajax({
                    data: $('#productForm').serialize(),
                    
                    url: "{{ route('categorias.store') }}",
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
                    url: "{{ route('categorias.store') }}"+'/'+id,
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