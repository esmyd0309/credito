  
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
        <template v-if="errorMostrarMsgPago.length > 0">
            <div class="alert alert-danger alert-dismissible">
                <button type="button" @click="resetError()" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h5><i class="icon fas fa-exclamation-triangle"></i>Error</h5>  
                <ul>
                    <li v-for="error in errorMostrarMsgPago" :key="error" v-text="error"></li>
                </ul>
            </div>
        </template>
        <br>
            <form @submit="formSubmit"  >
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
                        
                        <b-input-group prepend=" Peso *" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validardePesoNumerico()" v-model="form.peso"   required="required" placeholder="Ingrese un a peso">
                        </b-input-group>
                        
                    </b-col>
                
                
                    <b-col md="4">
                        <b-input-group prepend="Tamaño" class="mb-2 mr-sm-2 mb-sm-0">
                            <input  type="text" class="form-control" @keyup="validardeTamanoNumerico()" v-model="form.tamano">
                        </b-input-group>
                       
                    </b-col>

                    <b-col md="4">
                        <b-input-group prepend="Cantidad" class="mb-2 mr-sm-2 mb-sm-0">
                            <input  type="text" class="form-control" @keyup="validardeCantidadNumerico()" v-model="form.cantidad">
                        </b-input-group>
                       
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        
                        <b-input-group prepend="Precio Comprado" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" v-model="form.preciocomprado" @keyup="validardePreciocompradoNumerico()">
                        </b-input-group>
                    </b-col>
                
                    
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        
                        <b-input-group prepend="Precio" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" v-model="form.precio" @keyup="validardePrecioNumerico()">
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
                                <select  v-model="form.categoria" class="form-control mb-2"  >
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
                                <select v-model="form.proeevedor"  class="form-control mb-2" >
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
                        <b-button @click="agregar"  class="mt-3" variant="outline-success" block >Guardar</b-button>
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
                        
                        <strong>Marca: </strong> {{item.marca}}<br/>
                        <strong>Modelo: </strong> {{item.modelo}}<br/>
                        <strong>Color: </strong>   <b-badge v-bind:style="{ color: activeColor }" variant="light">{{ activeColor }} <span class="sr-only"></span></b-badge><br/>
                        <strong>Peso: </strong> {{item.peso}} kg.<br/>
                        <strong>Tamaño: </strong> {{item.tamano}} cm.<br/>
                        <strong>En Almacen: </strong> $ {{item.restante}}<br/>
                        <hr>
                        <strong>Valor Compra: </strong> $ {{item.preciocomprado}}<br/>
                        <strong>Precio Unitario: </strong> $ {{item.precio}}<br/>
                        <strong>Iva: </strong> $ {{item.iva}}<br/>
                        <strong>Ice: </strong> $ {{item.ice}}<br/>
                        <strong>Precio Total: </strong> $ {{item.total}}<br/>
                        <strong>Cantidad: </strong> {{item.cantidad}}<br/>
                        
                        <strong>inversion: </strong> $ {{item.valorInvertido}}<br/>
                        <strong>Recuperado: </strong> $ {{item.recuperado}}<br/>
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
                precio: 0.0,
                iva: 0.0,
                getIva: false,
                ice: 0.0,
                total: 0.0,
                marca: '',
                modelo: '',
                color: '#ff7674',
                peso: '',
                preciocomprado: '',
                tamano: 0.0,
                cantidad: 0.0,
                nota: '',
                proveedor_id: '',
                categoria_id: '',
                inversion:'',
                
                
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
            enlace: 'http://app2.datamarketingplus.ec/',
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
            errorPago: 0,
            errorMostrarMsgPago: [],
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

            axios.get(this.enlace+'getproeevedores')
                    .then(res => {
                    this.proevedores = res.data;
            });
            

            axios.get(this.enlace+'getcategoria')
                    .then(res => {
                    this.categoria = res.data;
            });
    },
    mounted() {
        this.gridApi = this.gridOptions.api;
        this.gridColumnApi = this.gridOptions.columnApi;
    },
    methods: {
        
        getIva(event){
               console.log(event)
              if(event){
                this.form.iva = parseFloat(this.previousPrice) *12/100
                this.form.total = parseFloat(this.form.iva)+parseFloat(this.form.precio)
                //this.form.iva = parseFloat(this.form.iva).toFixed(2)
                //this.form.total = parseFloat(this.form.total).toFixed(2)
              }else{
                   this.form.total = parseFloat(this.form.precio).toFixed(2)
                   
              }
             console.log(this.form.total) 
        },
           
    
        agregar(){
            if (this.form.total < 1) {
                this.form.total = parseFloat(this.form.precio).toFixed(2)
            }
            if(this.validate())
            {
                return
            }
            else
            {

                        this.form.inversion = parseFloat(this.form.precio).toFixed(2)  * this.form.cantidad;
                        const parametros  = {
                                                nombre:                 this.form.nombre,
                                                descripcion:            this.form.descripcion,
                                                precio:                 this.form.precio,
                                                preciocomprado:         this.form.preciocomprado,
                                                iva:                    this.form.iva,                                      
                                                total:                  this.form.total,
                                                marca:                  this.form.marca,
                                                modelo:                 this.form.modelo,
                                                color:                  this.form.color,
                                                peso:                   this.form.peso,
                                                cantidad:               this.form.cantidad,
                                                inversion:              parseFloat(this.form.inversion).toFixed(2),
                                                nota:                   this.form.nota,
                                                tamano:                 this.form.tamano,
                                                proveedor_id:           this.form.proeevedor,
                                                categoria_id:           this.form.categoria,
                                                
                                                
                                            }
                    console.log(parametros)
                                            this.form.nombre = '';
                                            this.form.descripcion = '';
                                            this.form.precio = '';
                                            this.form.preciocomprado = '';
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
            }
                 
            
        },
        validate () 
        {
            
            this.errorPago = 0
            this.errorMostrarMsgPago = []
            if(!this.form.nombre) this.errorMostrarMsgPago.push("Ingrese un  nombre")
            if(!this.form.precio) this.errorMostrarMsgPago.push("Ingrese un precio")
            if(!this.form.marca) this.errorMostrarMsgPago.push("Igrese una marca ")

            if(!this.form.modelo) this.errorMostrarMsgPago.push("Igrese el modelo")
            if(!this.form.color) this.errorMostrarMsgPago.push("Igrese el  color")
            if(!this.form.nota) this.errorMostrarMsgPago.push("Igrese un comentario")
           
            return this.errorPago
        },
        resetError()
        {
            this.errorMostrarMsgPago = []
            this.errorPago = 0
        },
        validardePesoNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.peso.length; i++)
            if (filtro.indexOf(this.form.peso.charAt(i)) != -1) 
                out += this.form.peso.charAt(i)
            this.form.peso = out
        },
        validardeTamanoNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.tamano.length; i++)
            if (filtro.indexOf(this.form.tamano.charAt(i)) != -1) 
                out += this.form.tamano.charAt(i)
            this.form.tamano = out
        },
        validardeCantidadNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.cantidad.length; i++)
            if (filtro.indexOf(this.form.cantidad.charAt(i)) != -1) 
                out += this.form.cantidad.charAt(i)
            this.form.cantidad = out
        },
        validardePreciocompradoNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.preciocomprado.length; i++)
            if (filtro.indexOf(this.form.preciocomprado.charAt(i)) != -1) 
                out += this.form.preciocomprado.charAt(i)
            this.form.preciocomprado = out

            
        },
        validardePrecioNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.precio.length; i++)
            if (filtro.indexOf(this.form.precio.charAt(i)) != -1) 
                out += this.form.precio.charAt(i)
            this.form.precio = out

            this.previousPrice = this.form.precio
            
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
                this.showarchivo = "http://app2.datamarketingplus.ec/"+selectedRowsString
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