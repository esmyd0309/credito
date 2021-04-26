<template>
    <div>
        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-secondary  shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2" v-for="(item, index) in getpagosTT" :key="index">
                                <div class="text-xs font-weight-bold text-secondary  text-uppercase mb-1" >
                                    Pagos  
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" > 
                                   <i class="fas fa-coins"></i>  
                                     {{ item.cantidad }}

                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning  shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2" v-for="(item, index) in getpagosTT" :key="index">
                                <div class="text-xs font-weight-bold text-warning  text-uppercase mb-1" >
                                   Ventas  vs   Pagos
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" > 
                                   <i class="fas fa-hand-holding-usd"></i>  
                                     {{ item.ventasPagos }}
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2" v-for="(item, index) in getpagosTT" :key="index">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1" >
                                    MONTOS  
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" > 
                                   <i class="fas fa-landmark"></i>  
                                    $ {{ parseFloat(item.valor).toFixed(2) }}
                            
                                  <small class="text-success">  <i class="fas fa-caret-up"></i></small>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
           
           
            
        </div>




        <b-modal 
            id="modal-xl-2" 
            size="xl" 
            title="Registrar Nuevo Pagos" 
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
            <form @submit="formSubmit" enctype="multipart/form-data" >

                <b-row>
                     <b-col md="12">
                        <multiselect v-model="form.cliente"  track-by="cedula" label="cedula" placeholder="Seleccione un cliente" :options="clientes" :searchable="true"  @input="clienteinput">
                            <template slot="singleLabel" slot-scope="{ option }"><strong>{{ option.cedula }}</strong> fue seleccionado<strong>  {{ option.apellidoPaterno }} {{ option.nombre1 }}</strong></template>
                        </multiselect>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.cliente" >
                   <b-col md="12">
                        <multiselect v-model="form.producto" placeholder="Seleccione Un producto" label="nombre" track-by="nombre" :options="productos"  @input="productoinput" >
                            <template slot="singleLabel" slot-scope="props"><img class="w-25 p-3 mb-1 h-25 d-inline-block" :src="props.option.archivo" >
                                <span class="option__desc">
                                    
                                    <strong>Nombre:</strong> <samp>{{ props.option.nombre }}</samp>
                                
                                    <strong>Modelo:</strong> <samp>${{ props.option.modelo }}</samp>
                                
                                    <strong>Saldo Abono:</strong> <samp>${{ props.option.saldo_abono }}</samp>
                                    
                                    <strong>Saldo Credito:</strong> <samp>${{ props.option.saldoDeuda }}</samp>
                                </span>
                            </template>

                            <template slot="option" slot-scope="props"><img class="w-25 p-3 mb-1" :src="props.option.archivo" >
                                <div class="option__desc">
                                    <span class="option__title">
                                        {{ props.option.nombre }}
                                    </span>
                                    <span class="option__small">
                                        {{ props.option.modelo }}
                                        </span>
                                </div>
                            </template>
                        </multiselect>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto ">

                    <b-col md="12"  >
                        <div class="table-responsive" >
                            <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Tabla de Amortización</strong> </center> </b-alert>

                                <table class="table table-bordered table-hover table-striped ">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Periodos</th>
                                            <th>Cuotas</th>
                                            <th v-if="form.tipopago==2">Saldo Deuda</th>
                                            <th v-if="form.tipopago==1">Saldo Abono</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(data, index) in cuotas" :key="index">
                                            <td>{{ data.fecha_pago}}</td>
                                            <td>{{ data.periodo}}</td>
                                            <td>$ {{ data.cuota}}</td>
                                            <td v-if="form.tipopago==2">$ {{ parseFloat((data.saldodeuda - form.valor).toFixed(2)) }}</td>
                                            <td v-if="form.tipopago==1">$ {{ data.saldo_abono}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                        </div>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto">  
                    <b-col md="6" v-for="(data, index) in cuotas" :key="index">

                        <b-input-group prepend="Tipo De Pago *" class="mb-2 mr-sm-2 mb-sm-0" v-if="data.estado_abono==0">
                            <select v-model="form.tipopago" class="form-control" required>
                                <option v-for="(item, index) in tipopagos" :key="index"  v-bind:value="item.value " >
                                    {{ item.text }}
                                </option>
                            </select>
                        </b-input-group>

                        <b-input-group prepend="Tipo De Pago *" class="mb-2 mr-sm-2 mb-sm-0" v-else>
                            <select v-model="form.tipopago" class="form-control" required>
                                <option v-for="(item, index) in tipopagosSinAbono" :key="index"  v-bind:value="item.value " >
                                    {{ item.text }}
                                </option>
                            </select>
                        </b-input-group>
                    </b-col>
                    <b-col md="6" >
                        <b-input-group prepend="Forma De Pago *" class="mb-2 mr-sm-2 mb-sm-0">
                            <select v-model="form.formapago" class="form-control" required>
                                <option v-for="(item, index) in formapagos" :key="index"  v-bind:value="item.value " >
                                    {{ item.text }}
                                </option>
                            </select>
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto">
                    <b-col md="6">
                        <b-input-group prepend=" Valor a Pagar ($) *" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validardePagosNumerico()" v-model="form.valor"   required="required" placeholder="Ingrese un valor a pagar">
                        </b-input-group>
                    </b-col>
                </b-row> 
                
                <br>
                <b-row>
                     <b-col md="12" v-if="form.producto">
                        <multiselect v-model="form.origen"  track-by="nombre" label="nombre" placeholder="Banco de Origen " :options="bancos" :searchable="true" @input="getbancoorigen" >
                            <template slot="singleLabel" slot-scope="{ option }">Origen del Recaudo<strong>  {{ option.nombre }}</strong></template>
                        </multiselect>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                    <b-col md="12" v-if="form.producto">
                        <multiselect v-model="form.destino"  track-by="nombre" label="nombre" placeholder="Seleccione un banco destino" :options="bancosdestino" :searchable="true"  @input="getbancodestino">
                            <template slot="singleLabel" slot-scope="{ option }">Destino de los fondos a <strong>  {{ option.nombre }} </strong></template>
                        </multiselect>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto">
                    <b-col md="12">
                        <b-input-group prepend="Documento (#)" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control"  v-model="form.documento"   required="required" placeholder="Ingrese el numero de documento del pago">
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto">  
                    <b-col md="12">
                        <b-input-group prepend="Fecha del Pago *" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-form-datepicker v-model="form.fechapago"  locale="en"></b-form-datepicker>
                        </b-input-group>                    
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="form.producto">
                    <b-col md="12">
                        <b-form-textarea
                            id="textarea"
                            v-model="form.comentario"
                            placeholder="Ingresar Nota del pago"
                            rows="3"
                            max-rows="6"
                        ></b-form-textarea>
                    </b-col>
                </b-row >
                <br>
                 <br>
                <b-row v-if="form.producto">
                    <b-col md="12">
                        <b-input-group prepend="Recibo" class="mb-2 mr-sm-2 mb-sm-0">

                            <b-form-file
                                v-model="file"
                                placeholder="Subir la Imagen..."
                                v-on:change="onFileChange"
                            ></b-form-file>
                        </b-input-group>
                        <div class="col-md-3" v-if="image!=''">
                                <img :src="image" class="img-responsive">
                        </div>
                    </b-col>
              
                </b-row>
                <br> 
                <b-row>
                    <b-col md="2">
                    </b-col>

                    <b-col md="4">
                        <!--<button type="button" @click="postPagos" class="btn btn-sm btn-success" v-if="amortizar == true"><i class="far fa-check-circle"></i> Establecer</button>-->

                        <b-button @click="postPagos"  class="mt-3" variant="outline-success" block  >Guardar</b-button>
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
               <b-row>
            <b-col md="12">
                <b-button  class="btn btn-primary login100-form-btn float-right"  @click="showgestion=true" v-b-modal.modal-xl-2 variant="success"> <i class="fas fa-credit-card"></i></b-button>

            </b-col>
        </b-row>
        <br>
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

        <b-modal 
            v-model="show"  
            id="modal-xl" 
            size="xl" 
            title="Gestion de Recaudación"
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
                        <b-button type="submit"  class="mt-3" variant="outline-success" block >Cargar Recibo</b-button>
                    </form>
                </b-col>
                <b-col md="8" v-else>
                    
                    <b-card-img :src="showarchivo" class="rounded-0"></b-card-img>
                    
                </b-col>
                <b-col md="4">
                    <b-card-body title="Detalle de la Recaudación">
                    <b-card-text v-for="(item, index) in showDocumento" :key="index"><br/>
                        <strong>Documento: </strong> {{item.documento}} <br/>
                        <strong>Fecha De Pago: </strong> {{item.fechapago}}<br/>
                        <strong>Forma de Pago:</strong> {{item.formapago}}<br/>
                        <strong>Valor: </strong> {{item.valor}}<br/>
                        <strong>Banco Origen: </strong> {{item.origen}}<br/>
                        <strong>Banco Destino: </strong> {{item.destino}}<br/>
                    <strong>Comentario: </strong> {{item.comentario}}<br/>
                        <strong>Nombre Archivo: </strong> {{item.nombreArchivo}}<br/>

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
import "ag-grid-community/dist/styles/ag-grid.css";
import "ag-grid-community/dist/styles/ag-theme-balham.css";
import { AgGridVue } from 'ag-grid-vue';
import { AllCommunityModules } from "@ag-grid-community/all-modules";
import Multiselect from 'vue-multiselect'
import swal from 'sweetalert2'


export default  {
    name: 'pagos',
   
    data() {
        return {
            form: {
                cliente: '',
                producto: '', 
                valor: 0.0,
                documento: '',
                formapago: '',
                tipopago: '',
                fechapago: '',
                origen: '',
                destino: '',
                comentario: '',
                origen_id: '',
                destino_id: '',
            },
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
            enlace: 'http://localhost/credito/public/',
            file: [],
            success: '',
            image: '',
            idc: null,
            clientes: [],
            productos: [],
            errorPago: 0,
            errorMostrarMsgPago: [],

            ///
            showgestion: false,
            variants: ['primary', 'secondary', 'success', 'warning', 'danger', 'info', 'light', 'dark'],
            headerBgVariant: 'dark',
            headerTextVariant: 'light',
            bodyBgVariant: 'light',
            bodyTextVariant: 'dark',
            footerBgVariant: 'warning',
            footerTextVariant: 'dark',
            ///
             tipopagos: [
                
                { text: 'CUOTAS', value: '2' }
            ],

            tipopagosSinAbono: [
                { text: 'ABONO', value: '1' },
                { text: 'CUOTAS', value: '2' }
            ],


            formapagos: [
                { text: 'DEPOSITO', value: 'DEPOSITO' },
                { text: 'TRANSFERENCIA', value: 'TRANSFERENCIA' },
                { text: 'GIROS', value: 'GIROS' },
                { text: 'OFICINA', value: 'OFICINA' },
                { text: 'TERRENO', value: 'TERRENO' }
            ],
            

            venta_id: '',
            cuotas: [],
            bancos: [],
            bancosdestino: [],
            id_pago: '',
            getpagosTT: [],

        }
    },
    components: {
        AgGridVue,
        Multiselect
    },
    created(){
     
        this.domLayout = "autoHeight";
        
    },
    beforeMount() {
        
            axios.get(this.enlace+'getclientesVentas')
                    .then(res => {
                    this.clientes = res.data;
            }).catch(err => 
                    {
                        console.log(err.response.data)
                     
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                    });

            axios.get(this.enlace+'getpagosTT')
                    .then(res => {
                    this.getpagosTT = res.data;
            }).catch(err => 
                    {
                        console.log(err.response.data)
                     
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                    });
            
        this.showAlert()
        this.gridOptions = {};

        this.columnDefs = [
            {headerName: 'Id', field: 'id'},
            {headerName: 'Registrado', field: 'fecha'},
            {headerName: 'Agente', field: 'agente'},
            {headerName: 'Documento', field: 'documento'},
            {headerName: 'Forma Pago', field: 'formapago'},
            {headerName: 'Feha Pago', field: 'fechapago'},
            {headerName: 'Valor', field: 'valor'},
            {headerName: 'Banco Origen', field: 'origen'},
            {headerName: 'Banco Destino', field: 'destino'},
            {headerName: 'Comentario', field: 'comentario'},
            {headerName: 'Archivo', field: 'archivo'},            
            {headerName: 'Nombre Archivo', field: 'nombreArchivo'},
            {headerName: 'Cargado Archivo', field: 'agenteRecibo'},
            {headerName: 'fecha Archivo', field: 'fechaRecibo'},



        ];
        this.defaultColDef = {
            //flex: 1,
            cellClass: 'cell-wrap-text',
            autoHeight: true,
            sortable: true,
            resizable: true,
        }

       
        fetch(this.enlace+'getPagos')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);
    },
    mounted() {
        this.gridApi = this.gridOptions.api;
        this.gridColumnApi = this.gridOptions.columnApi;

    },
    methods: {
        
        clienteinput(value){
            this.clientes_id = '';
            console.log(value);
            this.clientes_id = value.id
            if (this.clientes_id ) {
                axios.get(this.enlace+'getProductosCliente/'+this.clientes_id)
                    .then(res => {
                    this.productos = res.data;
                  
            }).catch(err => 
                    {
                        console.log(err.response.data)
                     
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                    });
            }
            
           
        },
        productoinput(value){
            if (value) {
                this.cuotas = null;
                this.venta_id = value.id
                if (this.venta_id) {
                        axios.get(this.enlace+'amortizaciondetalle/'+this.venta_id)
                            .then(res => {
                            this.cuotas = res.data;
                            console.log(this.cuotas );
                         });
                         
                }
            
              
            }
               
           
            axios.get(this.enlace+'getBancos')
                    .then(res => {
                    this.bancos = res.data;
            });
            axios.get(this.enlace+'getBancosdestino')
                    .then(res => {
                    this.bancosdestino = res.data;
            });
                
               
        },
        getbancodestino(value){
            if (value) {
                this.form.destino_id = value.id
                console.log(this.form.destino_id)
            }
        },

        getbancoorigen(value){
            if (value) {
                this.form.origen_id = value.id
                console.log(this.form.origen_id)
            }
        },
        postPagos()
        {
          
            
                if(this.validate())
                {
                    return
                }
                else
                {
                     const config = {
                        headers: { 'content-type': 'multipart/form-data' }
                    }
                    
                    let formData = new FormData();
                    formData.append('file',  this.file);                    
                    formData.append('clientes_id',      this.clientes_id);
                    formData.append('venta_id',         this.venta_id);
                    formData.append('documento',        this.form.documento);
                    formData.append('valor',            this.form.valor);
                    formData.append('origen_id',        this.form.origen_id);
                    formData.append('destino_id',       this.form.destino_id);
                    formData.append('tipopago',         this.form.tipopago);
                    formData.append('formapago',        this.form.formapago);
                    formData.append('fechapago',        this.form.fechapago);
                    formData.append('comentario',       this.form.comentario);

                  

                    axios.post(this.enlace+'pagos', formData,config)
                    .then(res => 
                    {
                        this.showgestion = false
                        swal(
                            'Correcto',
                            res.data.success,
                            'success'
                        )
                        this.getdatospagos();
                        this.reset();
                        me.resetError()
                     
                    }).catch(err => 
                    {
                        console.log(err.response.data)
                     
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                    })
                }
               
        },


        validate () 
        {
            
            this.errorPago = 0
            this.errorMostrarMsgPago = []
            if(!this.form.cliente) this.errorMostrarMsgPago.push("Seleccione un cliente")
            if(!this.form.valor) this.errorMostrarMsgPago.push("Ingrese un valor")
            if(!this.form.fechapago) this.errorMostrarMsgPago.push("Igrese una fecha de pago ")
            if(!this.form.documento) this.errorMostrarMsgPago.push("Igrese el numero de referencias")
            if(!this.form.formapago) this.errorMostrarMsgPago.push("Igrese una forma de pago")
            if(!this.form.origen) this.errorMostrarMsgPago.push("Igrese un Banco de origen")
            if(!this.form.destino) this.errorMostrarMsgPago.push("Igrese un Banco destino ")
            if (this.errorMostrarMsgPago.length) this.errorPago = 1
            return this.errorPago
        },
         resetError()
        {
            this.errorMostrarMsgPago = []
            this.errorPago = 0
        },
        reset()
        {
           
        this.clientes_id='';
        this.form.cliente='';
        this.form.producto='';
        this.form.origen='';
        this.form.destino='';
        this.venta_id='';
        this.form.documento='';
        this.form.valor='';
        this.form.origen_id='';
        this.form.destino_id='';
        this.form.tipopago='';
        this.form.formapago='';
        this.form.fechapago='';
        this.form.comentario='';
        this.file=[];
        },
        countDownChanged(dismissCountDown) {
            this.dismissCountDown = dismissCountDown
        },
        showAlert() {
            this.dismissCountDown = this.dismissSecs
        },
        onSelectionChanged() {
            var selectedRows = this.gridApi.getSelectedRows();
            var selectedRowsString = '';
            var maxToShow = 155;
            this.id_pago ='';
            this.showarchivo ='';

            selectedRows.forEach(function(selectedRow, index) {
                if (index >= maxToShow) {
                return;
                }
                if (index > 0) {
                selectedRowsString += ', ';
                }
                selectedRowsString += selectedRow.archivo;


            });
            if(selectedRowsString!='null'){
                this.showarchivo = "http://localhost/credito/public/"+selectedRowsString
            }
            this.showDocumento = selectedRows
            
            if (selectedRows.length > maxToShow) {
                var othersCount = selectedRows.length - maxToShow;
                selectedRowsString +=
                ' and ' + othersCount + ' other' + (othersCount !== 1 ? 's' : '');
            }
            document.querySelector('#selectedRows').innerHTML = selectedRowsString;
            selectedRows.forEach(element => {
                this.id_pago = element.id;

            });
            this.show=true
          
        },
        
        onFileChange(e){
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
            formData.append('id',this.id_pago);
            

            axios.post(this.enlace+'addrecibo', formData, config)
            .then(res => {
                            this.show = false
                            swal(
                                'Correcto',
                                res.data.success,
                                'success'
                            )
                this.getdatospagos();
            })
            .catch(function (error) {
                currentObj.output = error;
                
            });
            this.dismissCountDown=false
          
        },
        createImage(file) {
            if (file) {
                let reader = new FileReader();
                let vm = this;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
            }
           
        },
        validardePagosNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.valor.length; i++)
            if (filtro.indexOf(this.form.valor.charAt(i)) != -1) 
                out += this.form.valor.charAt(i)
            this.form.valor = out
        },
        getdatospagos(){
            fetch(this.enlace+'getPagos')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);

            axios.get(this.enlace+'getpagosTT')
                    .then(res => {
                    this.getpagosTT = res.data;
            }).catch(err => 
                    {
                        console.log(err.response.data)
                     
                        swal(
                            'Error',
                            err.response.data,
                            'error'
                        )
                    });
        }
    }
}
</script>