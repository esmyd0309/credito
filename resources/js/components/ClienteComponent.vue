<template>
   <div>
        
        <b-modal 
            id="modal-xl-2" 
            size="xl" 
            title="Registrar Nuevo Cliente" 
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
                    <b-alert show>
                        <strong>Datos Personales</strong> 
                    </b-alert>
                  
                 </b-row>
                                 <b-row>
                    <b-col md="6">
                        <b-input-group prepend=" Cedula *" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.cedula"
                                v-model="form.cedula" 
                                placeholder="Cedula"
                                required
                                maxlength="10"
                                minlength="10"
                            >
                            </b-input>
                        </b-input-group>
                         <small v-if="!comprobar.cedula">Es Obligatorio y un minimo de 10 Caracteres</small>
                    </b-col>
                    
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        <b-input-group prepend=" Primer Nombre *" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.nombre1"
                                v-model="form.nombre1" 
                                placeholder="Primer Nombre"
                                required
                            >
                            </b-input>
                        </b-input-group>
                         <small v-if="!comprobar.nombre1">Es Obligatorio y un minimo de 7 Caracteres</small>
                    </b-col>
                    <b-col md="6">
                        <b-input-group prepend=" Segundo Nombre" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                v-model="form.nombre2" 
                                placeholder="Segundo Nombre"
                                
                            >
                            </b-input>
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        <b-input-group prepend=" Apellido Paterno *" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                :state="comprobar.apellidoPaterno"
                                v-model="form.apellidoPaterno" 
                                placeholder="Apellido Paterno"
                                required
                            >
                            </b-input>
                        </b-input-group>
                        <small v-if="!comprobar.apellidoPaterno">Es Obligatorio y un minimo de 7 Caracteres</small>

                    </b-col>
                    <b-col md="6">
                        <b-input-group prepend=" Apellido Materno" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-input 
                                v-model="form.apellidoMaterno" 
                                placeholder="Apellido Materno"
                                
                            >
                            </b-input>
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha Nacimiento *</label>
                            <b-form-datepicker v-model="form.fechaNacimiento"  locale="en"></b-form-datepicker>
                        </div>

                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Prefijo Telefono</label>
                            </div>
                            <select v-model="form.prefijo" class="form-control" required>
                                <option v-for="(item, index) in prefijo" :key="index"  v-bind:value="item.value " >
                                    {{ item.text }}
                                </option>
                            </select>
                        </div>
                    </b-col>
                    <b-col md="4" v-if="form.prefijo!='09'">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Convencional casa</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                
                                placeholder="Numero Convencional solo 7 caracteres..."  
                                v-model="form.numero"
                                maxlength="7"
                                minlength="7"
                                required
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    <b-col md="4" v-if="form.prefijo=='09'">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Celular Personal</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                               
                                placeholder="Numero Celular solo 8 caracteres..."  
                                v-model="form.numero"
                                maxlength="8"
                                minlength="8"
                                
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    <b-col md="3" >
                        <strong > 
                            {{form.prefijo}} 
                            {{form.numero}}
                        </strong> 
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" >Email</label>
                                </div>
                                <b-form-input  
                                    class="form-control"
                                    placeholder="ejemplo@gmail.com..."  
                                    v-model="form.email"
                                    
                                >
                                </b-form-input>
                            </div>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="12">
                        <b-form-textarea
                            id="textarea"
                            :state="comprobar.direccionDomicilio"
                            v-model="form.direccionDomicilio"
                            placeholder="Direccion de Domicilio..."
                            rows="3"
                            max-rows="6"
                            required
                        ></b-form-textarea>
                        <small v-if="!comprobar.direccionDomicilio">Es Obligatorio y un minimo de 10 Caracteres</small>

                    </b-col>
                </b-row >
                <hr>
                <b-row>
                    <b-alert show>
                        <strong>Datos Laborales</strong> 
                    </b-alert>
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Nombre Empresa</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Nombre Empresa..."  
                                v-model="form.nombreEmpresa"
                               
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    
                </b-row>
                <br>
                <b-row>
                    <b-col md="6">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Cargo</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Cargo..."  
                                v-model="form.cargo"
                               
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    
                     <b-col md="6">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Salario</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Salario..."  
                                v-model="form.salario"
                               
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Prefijo </label>
                            </div>
                            <select v-model="form.prefijotrabajo" class="form-control" required>
                                <option v-for="(item, index) in prefijotrabajo" :key="index"  v-bind:value="item.value " >
                                    {{ item.text }}
                                </option>
                            </select>
                        </div>
                    </b-col>
                    <b-col md="4" v-if="form.prefijotrabajo!='09'">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Numero Convencional</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Numero Convencional solo 7 caracteres..."  
                                v-model="form.telefonoTrabajo"
                                maxlength="7"
                                minlength="7"
                                required
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    <b-col md="4" v-if="form.prefijotrabajo=='09'">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Numero Celular </label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Numero Celular solo 8 caracteres..."  
                                v-model="form.telefonoTrabajo"
                                maxlength="8"
                                minlength="8"
                                required
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                    <b-col md="3" >
                        <strong > 
                            {{form.prefijotrabajo}} 
                            {{form.telefonoTrabajo}}
                        </strong> 
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" >Extension</label>
                            </div>
                            <b-form-input  
                                class="form-control"
                                id="input-valid" 
                                placeholder="Extension oficina laboral..."  
                                v-model="form.extension"
                            >
                            </b-form-input>
                        </div>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="12">
                        <b-form-textarea
                            id="textarea"
                            v-model="form.direccionTrabajo"
                            placeholder="Direccion de Laboral..."
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
                    class="ag-theme-blue"
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
            title="Detalle del Cliente"
        >
    
        
        <b-card no-body class="overflow-hidden" >
            <b-row no-gutters>
                
            <b-col md="6" v-if="!showarchivo">
                <div v-if="success != ''" class="alert alert-success" role="alert">
                   <center>{{success}}</center>
                </div>

                <form @submit="formSubmit" enctype="multipart/form-data">
                    <b-form-file
                        v-model="file"
                        placeholder="Subir la Documento... JPG, PNG, TEXT,XLS,PDF,DOC"
                        v-on:change="onFileChange"
                    ></b-form-file>
                    <div class="col-md-3" v-if="image">
                        <img :src="image" class="img-responsive">
                    </div>
                    <b-button type="submit"  class="mt-3" variant="outline-success" block >Cargar Documento</b-button>
                </form>
            </b-col>
            <b-col md="6" v-else>
                
                <b-card-img :src="showarchivo" class="rounded-0"></b-card-img>
                <br>
                <hr>
                <center><a class="btn btn-success" :href="showarchivo"><i class="fas fa-download"></i> Documento</a></center>
            </b-col>
            <b-col md="6">
                <b-card-body title="Detalle del Cliente">
                <b-card-text v-for="(item, index) in showDocumento" :key="index"><br/>
                    <strong>Id: </strong> # {{item.id}} <br/>
                    <strong>Cedula: </strong> {{item.cedula}}<br/>
                    <strong>Nombres:</strong> {{item.nombre1}} {{item.nombre2}}  {{item.apellidoPaterno}}  {{item.apellidoMaterno}} <br/>
                    <strong>Fecha Nacimiento: </strong>  {{item.fechaNacimiento}}<br/>
                    <strong>Telefono Celular: </strong>  {{item.numero}}<br/>
                    <strong>Telefono Convenciona: </strong>  {{item.telefonoConvencional}}<br/>
                    <strong>Telefono Laboral: </strong> {{item.telefonoTrabajo}}<br/>
                    <strong>Telefono Laboral: </strong> {{item.extension}}<br/>
                    <strong>Email: </strong> {{item.email}}<br/>
                    <strong>Direccion Casa: </strong> {{item.direccionDomicilio}}<br/>
                    <strong>Nombre Empresa: </strong> {{item.nombreEmpresa}} <br/>
                    <strong>Cargo: </strong> {{item.cargo}} <br/>
                    <strong>Salario: </strong> $ {{item.salario}} <br/>
                    <strong>Direccion Laboral: </strong> {{item.direccionTrabajo}}<br/>
                    <hr>
                    <strong>Nombre Documento: </strong> {{item.nombreDocumento}}<br/>
                    <strong>Documento: </strong> {{item.documento}}<br/>
                    <strong>Agente Documento: </strong> {{item.agenteDocumetno}}<br/>
                    <strong>Fecha Documento: </strong> {{item.fechadocumento}}<br/>
                    <strong>Registrado: </strong> {{item.usuario}}<br/>
                    <strong>Fecha de Registrado: </strong> {{item.created_at}}<br/>
                    <br>
                    <hr>
                     <button type="button" @click="deleteCliente(item.id)" class="btn btn-danger" ><i class="fas fa-trash-alt"></i></button>
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
    name: 'cliente',
    
    data() {
         const now = new Date()
        const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
        // 15th two months prior
        const minDate = new Date(today)
        minDate.setMonth(minDate.getMonth())
        minDate.setDate(now.getDate())
        // 15th in two months
        const maxDate = new Date(today)
        maxDate.setMonth(maxDate.getMonth() + 1)
        maxDate.setDate(15)
        return {
                form: {
                    cedula: '',
                    nombre1: '',
                    nombre2: '',
                    apellidoPaterno: '',
                    apellidoMaterno: '',
                    fechaNacimiento: '',
                    direccionDomicilio: '',
                    prefijo: '',
                    numero: '',
                    telefonoConvencional: '',
                    prefijotrabajo: '',
                    telefonoTrabajo: '',
                    extension: '',
                    salario: '',
                    email: '',
                    ciudad_id: '',
                    provincia_id: '',
                    municipio_id: '',
                    direccionTrabajo: '',
                    nombreEmpresa: '',
                    cargo: '',

                   
                
                
            },
         
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
           
            
            previousPrice: null,
            
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
            enlace: 'http://23.236.49.200/',
            file: '',
            success: '',
            image: '',
            idc: null,
            activeColor: '',
            
            prefijo: [
                { text: '02', value: '02' },
                { text: '03', value: '03' },
                { text: '04', value: '04' },
                { text: '05', value: '05' },
                { text: '06', value: '06' },
                { text: '07', value: '07' },
                { text: '08', value: '08' },
                { text: '09', value: '09' },
            ],
            prefijotrabajo: [
                { text: '02', value: '02' },
                { text: '03', value: '03' },
                { text: '04', value: '04' },
                { text: '05', value: '05' },
                { text: '06', value: '06' },
                { text: '07', value: '07' },
                { text: '08', value: '08' },
                { text: '09', value: '09' },
            ],
            clientes: []
        }
    },
    components: {
        AgGridVue
    },
    computed: {


        comprobar()
        {
            return  { 
                
               

                nombre1:            this.form.nombre1.length > 5 ? true : false,
                apellidoPaterno:    this.form.apellidoPaterno.length > 5  ? true : false,
                cedula:             this.form.cedula.length > 10 ? true : false,
                direccionDomicilio: this.form.direccionDomicilio.length >= 10 ? true : false
                
               
                
                
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
            {headerName: 'Cedula', field: 'cedula'},
            {headerName: 'Apellido', field: 'apellidoPaterno'},
            {headerName: 'Apellido Materno', field: 'apellidoMaterno'},
            {headerName: 'Nombre', field: 'nombre1'},
            {headerName: 'Nombre 2', field: 'nombre2'},
            {headerName: 'Apellido Materno', field: 'apellidoMaterno'},
            {headerName: 'Fecha Nacimiento', field: 'fechaNacimiento'},
            {headerName: 'Prefijo', field: 'prefijo',editable: true},
            {headerName: 'Numero', field: 'numero',editable: true},
            {headerName: 'Telefono Convencional', field: 'telefonoConvencional'},
            {headerName: 'Prefijo trabajo', field: 'prefijotrabajo'},
            {headerName: 'Telefono Trabajo', field: 'telefonoTrabajo'},
            {headerName: 'Extension', field: 'extension'},
            {headerName: 'Direccion Domicilio', field: 'direccionDomicilio'},
            {headerName: 'Email', field: 'email'},
            {headerName: 'Direccion Trabajo', field: 'direccionTrabajo'},
            {headerName: 'Nombre Empresa', field: 'nombreEmpresa'},
            {headerName: 'Cargo', field: 'cargo'},
            {headerName: 'Salario', field: 'salario'},
           
        ];
        this.defaultColDef = {
            //flex: 1,
            cellClass: 'cell-wrap-text',
            autoHeight: true,
            sortable: true,
            resizable: true,
        }
       
        fetch('getclientes')
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
                                    cedula:                 this.form.cedula,
                                    nombre1:                this.form.nombre1,
                                    nombre2:                this.form.nombre2,
                                    apellidoPaterno:        this.form.apellidoPaterno,                                      
                                    apellidoMaterno:        this.form.apellidoMaterno,
                                    fechaNacimiento:        this.form.fechaNacimiento,
                                    prefijo:                this.form.prefijo,
                                    numero:                 this.form.numero,
                                    telefonoConvencional:   this.form.telefonoConvencional,
                                    prefijotrabajo:         this.form.prefijotrabajo,
                                    email:                  this.form.email,
                                    salario:                this.form.salario,
                                    telefonoTrabajo:        this.form.telefonoTrabajo,
                                    extension:              this.form.extension,
                                    direccionDomicilio:     this.form.direccionDomicilio,
                                    direccionTrabajo:       this.form.direccionTrabajo,
                                    nombreEmpresa:          this.form.nombreEmpresa,
                                    cargo:                  this.form.cargo,
                                    
                                    
                                }
        
                                this.form.cedula='';
                                this.form.nombre1='';
                                this.form.nombre2='';
                                this.form.apellidoPaterno='';                                      
                                this.form.apellidoMaterno='';
                                this.form.fechaNacimiento='';
                                this.form.prefijo='';
                                this.form.numero='';
                                this.form.telefonoConvencional='';
                                this.form.prefijotrabajo='';
                                this.form.email='';
                                this.form.salario='';    
                                this.form.telefonoTrabajo='';
                                this.form.extension='';
                                this.form.direccionDomicilio='';
                                this.form.direccionTrabajo='';
                                this.form.nombreEmpresa='';
                                this.form.cargo='';

                axios.post(this.enlace+'clientes',parametros)
                .then(res => {
                    this.clientes.push(res.data),
                    this.getrow()
                    swal(
                            'Cliente Registrado con Exito,',
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
            
            if(!this.form.nombre1){
                this.errors.push('El nombre es Obligatorio');
            }
            if(!this.form.apellidoPaterno){
                this.errors.push('El apellido es Obligatorio');
            }

             if(!this.form.cedula){
                this.errors.push('El apellido es Obligatorio');
            }
            

             if(!this.form.direccionDomicilio){
                this.errors.push('El apellido es Obligatorio');
            }
            
            
            

            
            
            if(this.form.nombre1 && this.form.apellidoPaterno && this.form.cedula && this.form.direccionDomicilio ){
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
                selectedRowsString += selectedRow.documento;
              
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
            
            axios.post(this.enlace+'adddocumento', formData, config)
            .then(function (response) {
                if (response) 
                    {
                        swal(
                            'Documento!',
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
    
        fetch('getclientes')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);
        
        },
        deleteCliente(value){
           
          swal({
                    title: '¿Seguro que quieres eliminar el Cliente?',
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
                        axios.delete(this.enlace+'deletecliente/'+value)
                        .then( res => {
                            this.show=false
                            this.getrow()
                            swal(
                            'Borrarlo!',
                            'Cliente eliminado.',
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