  
<template>
   <div>
        
        <b-modal 
            id="modal-xl-2" 
            size="xl" 
            title="Registrar Nuevo Producto" 
            v-model="showgestion"
            :header-bg-variant="headerBgVariant"
            :header-text-variant="headerTextVariant"
            :body-bg-variant="bodyBgVariant"
            :body-text-variant="bodyTextVariant"
            :footer-bg-variant="footerBgVariant"
            :footer-text-variant="footerTextVariant"            
        >
        
            <form  v-on:submit.prevent="checkForm" >
                <b-row>
                    <b-col md="12">
                        
                        <b-input-group prepend="Nombre" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.nombre"
                                v-model="form.nombre" 
                                placeholder="Nombre del Producto"
                                required
                            >
                            </b-input>
                        </b-input-group>
                         <small v-if="!comprobar.nombre">Es Obligatorio y un minimo de 7 Caracteres</small>
                    </b-col>
                </b-row>
                <br>
                
                <b-row>
                    <b-col md="12">
                        
                        <b-input-group prepend="Descripcion" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                
                                :state="comprobar.descripcion"
                                v-model="form.descripcion" 
                                placeholder="Descripcion"
                                required
                            >
                            </b-input>
                        </b-input-group>
                            <small v-if="!comprobar.descripcion">Es Obligatorio y un minimo de 10 Caracteres</small>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        
                        <b-input-group prepend="Modelo" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.modelo"
                                v-model="form.modelo" 
                                placeholder="Modelo del Producto"
                                required
                            >
                            </b-input>
                        </b-input-group>
                         <small v-if="!comprobar.modelo">Es Obligatorio y un minimo de 2 Caracteres</small>
                    </b-col>
                
                    <b-col md="6">
                        
                        <b-input-group prepend="Marca" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.marca"
                                v-model="form.marca" 
                                placeholder="Marca del Producto"
                                required
                            >
                            </b-input>
                        </b-input-group>
                         <small v-if="!comprobar.marca">Es Obligatorio y un minimo de 2 Caracteres</small>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="4">
                        <b-input-group prepend="Peso" class="mb-2 mr-sm-2 mb-sm-0">
                            <input  v-model.number="form.peso" v-model="form.peso" >
                        </b-input-group>
                        
                    </b-col>
                
                
                    <b-col md="4">
                        <b-input-group prepend="Tamaño" class="mb-2 mr-sm-2 mb-sm-0">
                            <input  v-model.number="form.tamano" v-model="form.tamano">
                        </b-input-group>
                       
                    </b-col>

                    <b-col md="4">
                        <b-input-group prepend="Cantidad" class="mb-2 mr-sm-2 mb-sm-0">
                            <input  v-model.number="form.cantidad" v-model="form.cantidad">
                        </b-input-group>
                       
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        
                        <b-input-group prepend="Precio" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="number" v-model.number="form.precio" v-model="form.precio" @input="handleInput">
                        </b-input-group>
                    </b-col>
                
                    <b-col md="3">
                        <b-form-checkbox switch size="lg" v-model="form.iva" @input="getIva" >Iva 12%</b-form-checkbox>
                    </b-col>
                        <table v-if="form.iva >1">
                            <tr>
                                <th>Iva </th>
                                <th>{{form.iva}}</th>
                            </tr>
                            <tr>
                                <th>Precio </th>
                                <th>{{form.precio}}</th>
                            </tr>
                            <tr>
                                <th><hr> </th>
                                <th><hr></th>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <th><code>{{form.total}}</code> </th>
                            </tr>
                        </table>
                </b-row>
                <br>
                <b-row>
                  
                    <b-col md="6">
                        
                        <b-input-group prepend="Color" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="color"  v-model="form.color"  class="form-control" required />
                        </b-input-group>
                       
                    </b-col>
                </b-row >
                <br>
                <b-row>
                    <b-col md="6">
                      
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text">Categoria </label>
                            </div>
                                <select  v-model="form.categoria" class="form-control mb-2" required >
                                    <option disabled>Seleccione la Categoria</option>
                                    <option v-for="(item, index) in categoria" :key="index" v-bind:value="item.id">{{ item.nombre }}</option>
                                </select>
                        </div>
                    </b-col>
                    <b-col md="6">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text">Proeevedor </label>
                            </div>
                                <select v-model="form.proeevedor"  class="form-control mb-2" required>
                                    <option  disabled>Seleccione el Proeevedor</option>
                                    <option v-for="(item, index) in proevedores" :key="index" v-bind:value="item.id">{{ item.nombre }}</option>
                                </select>
                        </div>
                    </b-col>
                </b-row >
                <br>
                <b-row>
                    <b-col md="12">
                        <b-form-textarea
                            id="textarea"
                            v-model="form.nota"
                            placeholder="Ingresar Nota del producto"
                            rows="3"
                            max-rows="6"
                        ></b-form-textarea>
                    </b-col>
                </b-row >
                
                <br>
                <b-row>
                    <b-col md="2">
                    </b-col>

                    <b-col md="4">
                        <b-button type="submit"  class="mt-3" variant="outline-success" block >Guardar</b-button>
                    </b-col>

                    <b-col md="4">
                         <b-button class="mt-3" variant="outline-danger" block @click="showgestion=false">Cerrar</b-button>
                    </b-col>
                    <b-col md="2">
                    </b-col>
                </b-row>
            </form>
            
            <template v-slot:modal-footer>
                <div class="w-100">
                <p class="float-left">Debe llenar todo los campos requeridos</p>
                </div>
            </template>
        </b-modal>
        <b-alert
            :show="dismissCountDown"
            dismissible
            variant="warning"
            @dismissed="dismissCountDown=0"
            @dismiss-count-down="countDownChanged"
        >
        <strong>Para ver el detalle de cada registro, ejecute doble click  {{ dismissCountDown }} segundos...</strong> 
        </b-alert>
        <div class="test-header" hidden>
            Selecionado:
            <span id="selectedRows" ></span>
        </div>
        <b-row>
            <b-col md="12">
                <b-button  class="btn btn-primary login100-form-btn float-right"  @click="showgestion=true" v-b-modal.modal-xl-2 variant="success"> <i class="fas fa-user-plus"></i> Registrar</b-button>

            </b-col>
        </b-row>
        <br>
        <b-row>
            <b-col md="12">
                <ag-grid-vue 
                    style="width: 100%; height: 100%;"
                    class="ag-theme-balham-dark"
                    id="myGrid"
                    :gridOptions="gridOptions"
                    :columnDefs="columnDefs"
                    :rowData="rowData"
                    :domLayout="domLayout"
                    :modules="modules" 
                    :rowDragManaged="true"
                    :enableColResize="true"
                    :defaultColDef="defaultColDef"
                    enableSorting="true"
                    enableFilter="true"
                    animateRows="true"
                    pagination="true"
                    rowSelection="multiple"
                    @selection-changed="onSelectionChanged"
                >
                </ag-grid-vue>
            </b-col>
        </b-row>
        
           

        <b-modal 
            v-model="show"  
            id="modal-xl" 
            size="xl" 
            title="Detalle del Producto"
        >
    
        
        <b-card no-body class="overflow-hidden" >
            <b-row no-gutters>
                
            <b-col md="8" v-if="!showarchivo">
                <div v-if="success != ''" class="alert alert-success" role="alert">
                   <center>{{success}}</center>
                </div>

                <form @submit="formSubmit" enctype="multipart/form-data">
                    <b-form-file
                        v-model="file"
                        placeholder="Subir la Imagen..."
                        v-on:change="onFileChange"
                    ></b-form-file>
                    <div class="col-md-3" v-if="image">
                        <img :src="image" class="img-responsive">
                    </div>
                    <b-button type="submit"  class="mt-3" variant="outline-success" block >Cargar Imagen</b-button>
                </form>
            </b-col>
            <b-col md="8" v-else>
                
                <b-card-img :src="showarchivo" class="rounded-0"></b-card-img>
                
            </b-col>
            <b-col md="4">
                <b-card-body title="Detalle del Producto">
                <b-card-text v-for="(item, index) in showDocumento" :key="index"><br/>
                    <strong>Id: </strong> # {{item.id}} <br/>
                    <strong>Producto: </strong> {{item.nombre}}<br/>
                    <strong>Descripcion:</strong> {{item.descripcion}}<br/>
                    <strong>Valor: </strong> $ {{item.precio}}<br/>
                    <strong>Iva: </strong> $ {{item.iva}}<br/>
                    <strong>Ice: </strong> $ {{item.ice}}<br/>
                    <strong>Marca: </strong> {{item.marca}}<br/>
                    <strong>Modelo: </strong> {{item.modelo}}<br/>
                    <strong>Color: </strong>   <b-badge v-bind:style="{ color: activeColor }" variant="light">{{ activeColor }} <span class="sr-only"></span></b-badge><br/>
                    <strong>Peso: </strong> {{item.peso}} kg.<br/>
                    <strong>Tamaño: </strong> {{item.tamano}} cm.<br/>
                    <strong>Nota: </strong> {{item.nota}}<br/>
                    <strong>Registrado: </strong> {{item.usuario}}<br/>
                    <strong>Fecha de Registrado: </strong> {{item.created_at}}<br/>
                    <br>
                    <hr>
                     <button type="button" @click="deleteProducto(item.id)" class="btn btn-danger" ><i class="fas fa-trash-alt"></i></button>
                </b-card-text>
                </b-card-body>
            </b-col>
            </b-row>
        </b-card>

    </b-modal>


   </div>
</template>

<script>
import axios from 'axios'
import Vue from "vue";
import 'whatwg-fetch';
import MagicVueInput from 'magic-vue-input'
import "ag-grid-community/dist/styles/ag-grid.css";
import "ag-grid-community/dist/styles/ag-theme-balham.css";
import { AgGridVue } from 'ag-grid-vue';
import { AllCommunityModules } from "@ag-grid-community/all-modules";
import swal from 'sweetalert2'

const pluginOptions = {
  /* see config reference */
  globalOptions: { currency: 'USD' }
}
const options = {
    confirmButtonColor: '#41b882',
    cancelButtonColor: '#ff7674',
};

export default  {
    name: 'recaudaciones',
    props: {
        id: {
        default: 1
        },
        cedula: {
        default: 1
        }
    },
    data() {
        return {
                form: {
                nombre: '',
                descripcion: '',
                precio: '',
                iva: '',
                getIva: false,
                ice: '',
                total: 0.0,
                marca: '',
                modelo: '',
                color: '#ff7674',
                peso: '',
                tamano: '',
                cantidad: '',
                nota: '',
                proveedor_id: '',
                categoria_id: ''
                
                
            },
          types: ['color'],
            errors: [],
            crear: true,
            showgestion: false,
            variants: ['primary', 'secondary', 'success', 'warning', 'danger', 'info', 'light', 'dark'],
            headerBgVariant: 'dark',
            headerTextVariant: 'light',
            bodyBgVariant: 'light',
            bodyTextVariant: 'dark',
            footerBgVariant: 'warning',
            footerTextVariant: 'dark',
            enlace: 'http://23.236.49.200/',
            proevedores: [],
            categoria: [],
            previousPrice: null,
            productos: [],
            columnDefs: null,
            rowData: null,
            domLayout: null,
            modules: AllCommunityModules,            
            defaultColDef: null,
            gridApi: null,
            show: false,
            showDocumento: '',
            showarchivo: null,
            dismissSecs: 10,
            dismissCountDown: 0,
            file: '',
            success: '',
            image: '',
            idc: null,
            activeColor: '',
        }
    },
    components: {
        AgGridVue
    },
    computed: {


        comprobar()
        {
            return  { 
                
                nombre: this.form.nombre.length > 10 ? true : false,
                descripcion: this.form.descripcion.length > 10  ? true : false,
                marca: this.form.marca.length > 2 ? true : false,
                modelo: this.form.modelo.length > 2 ? true : false,
                tamano: this.form.tamano.length >= 2 ? true : false,
                cantidad: this.form.cantidad.length >= 1 ? true : false,
                nota: this.form.nota.length >= 10 ? true : false,

               
                
                
            }
        }
            
    },
    created(){
     
        this.domLayout = "autoHeight";
        
    },
    beforeMount() {
        axios.get(this.enlace+'getproeevedores')
                    .then(res => {
                    this.proevedores = res.data;
            });
            

            axios.get(this.enlace+'getcategoria')
                    .then(res => {
                    this.categoria = res.data;
            });
        this.showAlert()
        this.gridOptions = {};
        this.columnDefs = [
            {headerName: 'Registrado', field: 'created_at'},
            {headerName: 'Agente', field: 'usuario'},
            {headerName: 'Producto', field: 'nombre'},
            {headerName: 'Descripcion', field: 'descripcion'},
            {headerName: 'Marca', field: 'marca',editable: true},
            {headerName: 'Modelo', field: 'modelo',editable: true},
            {headerName: 'Cantidad', field: 'cantidad'},
            {headerName: 'Categoria', field: 'categoria'},
            {headerName: 'Proeevedor', field: 'proeevedor'},
            {headerName: 'Archivo', field: 'archivo'},
        ];
        this.defaultColDef = {
            //flex: 1,
            cellClass: 'cell-wrap-text',
            autoHeight: true,
            sortable: true,
            resizable: true,
        }
       
        fetch('getproductos')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);
        },
    mounted() {
        this.gridApi = this.gridOptions.api;
        this.gridColumnApi = this.gridOptions.columnApi;
    },
    methods: {
         handleInput (e) {
            this.form.iva = false
            let stringValue = e.target.value.toString()
            let regex = /^\d*(\.\d{1,2})?$/
            if(!stringValue.match(regex) && this.form.precio!== '') {
                this.form.precio = this.previousPrice
            }
            this.previousPrice = this.form.precio
            
        },
        getIva(event){
              
              if(event){
                this.form.iva = parseFloat(this.previousPrice) *12/100
                this.form.total = parseFloat(this.form.iva)+parseFloat(this.form.precio)
                this.form.iva = parseFloat(this.form.iva).toFixed(2)
                this.form.total = parseFloat(this.form.total).toFixed(2)
              }else{
                   this.form.total = parseFloat(this.form.precio).toFixed(2)
                   
              }
              
        },
           
    
        agregar(){
            const parametros  = {
                                    nombre:                 this.form.nombre,
                                    descripcion:            this.form.descripcion,
                                    precio:                 this.form.precio,
                                    iva:                    this.form.iva,                                      
                                    total:                  this.form.total,
                                    marca:                  this.form.marca,
                                    modelo:                 this.form.modelo,
                                    color:                  this.form.color,
                                    peso:                   this.form.peso,
                                    cantidad:               this.form.cantidad,
                                    
                                    nota:                   this.form.nota,
                                    tamano:                 this.form.tamano,
                                    proveedor_id:           this.form.proeevedor,
                                    categoria_id:           this.form.categoria,
                                    
                                    
                                }
        
                                this.form.nombre = '';
                                this.form.descripcion = '';
                                this.form.precio = '';
                                this.form.iva = '';                                      
                                this.form.total = '';
                                this.form.marca = '';
                                this.form.modelo = '';
                                this.form.color = '';
                                this.form.peso = '';
                                this.form.cantidad = '';
                                this.form.image = '';
                                this.form.nota = '';
                                this.form.proeevedor = '';
                                this.form.categoria = '';

            axios.post(this.enlace+'productos',parametros)
                .then(res => {
                    this.productos.push(res.data),
                    this.getrow()
                    swal(
                            'Producto Registrado con Exito,',
                            res.data.success,
                            'success'
                        )
                })
                .catch(err => {
                        console.log(err.response.data)
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                });

            this.showgestion=false
                 
            
        },
        checkForm: function(){
            this.errors = [];
            
            if(!this.form.nombre){
                this.errors.push('El nombre es Obligatorio');
            }
            if(!this.form.descripcion){
                this.errors.push('El apellido es Obligatorio');
            }
            
            

            
            
            if(this.form.nombre && this.form.descripcion ){
                this.agregar();
          
            }
            
        },
        countDownChanged(dismissCountDown) {
            this.dismissCountDown = dismissCountDown
        },
        showAlert() {
            this.dismissCountDown = this.dismissSecs
        },
        onSelectionChanged() {
            this.showarchivo ='';
            this.activeColor ='';
            var selectedRows = this.gridApi.getSelectedRows();
            var selectedRowsString = '';
            var colorproducto = '';
            var maxToShow = 155;
            selectedRows.forEach(function(selectedRow, index) {
                if (index >= maxToShow) {
                return;
                }
                if (index > 0) {
                selectedRowsString += ', ';
                }
                selectedRowsString += selectedRow.archivo;
              
                colorproducto = selectedRow.color;
               
            });
            if(selectedRowsString!='null'){
                this.showarchivo = "http://23.236.49.200/"+selectedRowsString
            }
            this.showDocumento = selectedRows
            if (selectedRows.length > maxToShow) {
                var othersCount = selectedRows.length - maxToShow;
                selectedRowsString +=
                ' and ' + othersCount + ' other' + (othersCount !== 1 ? 's' : '');
            }
            document.querySelector('#selectedRows').innerHTML = selectedRowsString;
            selectedRows.forEach(element => {
                this.idc = element.id;
            });
             this.activeColor += colorproducto;
                console.log( this.showarchivo);
            this.show=true
        },
        onFileChange(e){
            console.log(e.target.files[0]);
            this.file = e.target.files[0];
            let files = e.target.files || e.dataTransfer.files;
            if (!files.length)
                return;
            this.createImage(files[0]);
        },
        formSubmit(e) {
            e.preventDefault();
            let currentObj = this;
            const config = {
                headers: { 'content-type': 'multipart/form-data' }
            }
            let formData = new FormData();
            formData.append('file', this.file);
            formData.append('id',this.idc);
            
            axios.post(this.enlace+'addimagen', formData, config)
            .then(function (response) {
                if (response) 
                    {
                        swal(
                            'Imagen!',
                            'Cargada Correctamente.',
                            'success'
                        )
                       this.show=false
                        this.getrow()
                    }
                currentObj.success = response.data.success;
            })
           
            .catch(function (error) {
                currentObj.output = error;
            });
            this.dismissCountDown=false
            this.show=false
            this.showarchivo ='';
            this.activeColor ='';
            this.getrow()
        },
        createImage(file) {
            let reader = new FileReader();
            let vm = this;
            reader.onload = (e) => {
                vm.image = e.target.result;
            };
            reader.readAsDataURL(file);
        },
        getrow(){
    
        fetch('getproductos')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);
        
        },
        deleteProducto(value){
           
          swal({
                    title: '¿Seguro que quieres eliminar el Producto?',
                    text: "No podrás revertir esta acción luego",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'Cancelar',
                    confirmButtonText: 'Si, borrarlo!'
                }).then((result) => {
                    if (result.value) 
                    {
                        let me = this
                        axios.delete(this.enlace+'deleteproducto/'+value)
                        .then( res => {
                            this.show=false
                            this.getrow()
                            swal(
                            'Borrarlo!',
                            'Producto eliminado.',
                            'success'
                            )
                        })
                        .catch( err => {
                            console.log(err)
                            let error = err.response.data
                            if (err.response.data == 'Unauthorized.') 
                            {
                                error = 'Usuario con rol no autorizado'
                            }
                            swal(
                                'Error',
                                error,
                                'error'
                            )
                        })
                    }
                })
                
        }
    }
}
</script>