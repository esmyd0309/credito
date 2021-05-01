<template>

    <div>
        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2" v-for="(item, index) in reporteVentas" :key="index">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1" >
                                    Recuperado (ventas*)
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-if="item.recuperado"> 
                                   <i class="fas fa-landmark"></i>  
                                   $ {{ parseFloat(item.recuperado).toFixed(2) }}
                            
                                  <small class="text-success" > {{ (parseFloat(item.recuperado).toFixed(2)  / parseFloat(item.deuda ).toFixed(2)*100).toFixed() }}% <i class="fas fa-caret-up"></i></small>
                                </div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800" v-else> 
                                   <i class="fas fa-landmark"></i>  
                                   $ 0
                            
                                  <small class="text-success" > 0% <i class="fas fa-caret-down"></i></small>
                                </div>
                                <hr>
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Por Recuperar (ventas)
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-if="item.saldo"> 
                                     <i class="fas fa-file-invoice-dollar"></i> $ {{ parseFloat(item.saldo).toFixed(2) }}

                                      <small class="text-danger">  {{ (parseFloat(item.saldo).toFixed(2)  / parseFloat(item.deuda ).toFixed(2)*100).toFixed() }}% <i class="fas fa-caret-down"></i></small>
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-else> 
                                     <i class="fas fa-file-invoice-dollar"></i> $ 0

                                      <small class="text-danger">  0% <i class="fas fa-caret-down"></i></small>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
           
                <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Ventas a Creditos
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-for="(item, index) in ttcreditos" :key="index"> 
                                    <i class="fas fa-credit-card"></i> {{ item.cantidad}} 
                                    <hr/> 
                                    <div v-if="item.deuda">
                                         <i class="fas fa-dollar-sign" ></i> {{ parseFloat(item.deuda).toFixed(2) }}
                                    </div>
                                    <div v-else>
                                        <i class="fas fa-dollar-sign" ></i> 0
                                    </div>
                                   
                                </div>
                            </div>
                            <div class="col-auto">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
                            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Ventas a Decontado
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-for="(item, index) in ttdecontado" :key="index">
                                    <i class="fas fa-hand-holding-usd"></i> {{ item.cantidad}} 
                                    <hr/> 
                                    <i class="fas fa-dollar-sign"></i> 
                                   <strong v-if="item.deuda  >0" class="h5 mb-0 font-weight-bold text-gray-800">{{ parseFloat(item.deuda).toFixed(2) }}</strong> 
                                   <strong v-else class="h5 mb-0 font-weight-bold text-gray-800">0</strong>
                                </div>
                            </div>
                            <div class="col-auto">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
 
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    VENTAS TOTALES
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" v-for="(item, index) in reporteVentas" :key="index"> 
                                    <i class="fas fa-cart-arrow-down"></i> {{ item.cantidad}} 
                                    <hr/> 
                                  
                                    <div v-if="item.deuda">
                                         <i class="fas fa-dollar-sign" ></i>  {{ parseFloat(item.deuda).toFixed(2)}}
                                    </div>
                                    <div v-else>
                                        <i class="fas fa-dollar-sign" ></i> 0
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <b-modal 
            id="modal-xl-2" 
            size="xl" 
            title="Registrar Nueva Venta" 
            v-model="showgestion"
            :header-bg-variant="headerBgVariant"
            :header-text-variant="headerTextVariant"
            :body-bg-variant="bodyBgVariant"
            :body-text-variant="bodyTextVariant"
            :footer-bg-variant="footerBgVariant"
            :footer-text-variant="footerTextVariant"            
        >
            <loading :active.sync="isLoading"/>
            <form  v-on:submit.prevent="checkForm" >
                 <br>
                <b-row>
                     <b-col md="12">
                        <multiselect v-model="form.cliente"  track-by="cedula" label="cedula" placeholder="Seleccione un cliente" :options="clientes" :searchable="true"  @input="clienteinput">
                            <template slot="singleLabel" slot-scope="{ option }"><strong>{{ option.cedula }}</strong> fue seleccionado<strong>  {{ option.apellidoPaterno }} {{ option.nombre1 }}</strong></template>
                        </multiselect>
                    </b-col>
                </b-row>
                  <br>
                <b-row>
                    <b-col md="12">
                        <multiselect v-model="form.producto" placeholder="Seleccione Un producto" label="nombre" track-by="nombre" :options="productos"  @input="productoinput" >
                            <template slot="singleLabel" slot-scope="props"><img class="w-25 p-3 mb-1 h-25 d-inline-block" :src="props.option.archivo" >
                                <span class="option__desc">
                                    
                                    <strong>Nombre:</strong> <samp>{{ props.option.nombre }}</samp>
                                
                                    <strong>Modelo:</strong> <samp>${{ props.option.modelo }}</samp>
                                
                                    <strong>Precio:</strong> <samp>${{ props.option.total }}</samp> <br>  
                                    <strong>en stock:</strong> <samp> <code>{{ props.option.restante }}</code> </samp> <br>
                                    <h3><strong v-if=" props.option.restante < 1"> <code>NO HAY EN stock este producto</code> </strong></h3>
                                    <h3><strong v-if=" cantidadproducto >1 && props.option.restante < cantidadproducto"> <code>NO HAY EN stock ESA CANTIDAD</code> </strong></h3>
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
                    <b-col md="12">
                        <div class="text-center" v-if="form.producto">
                            <b-button variant="primary">
                                Valor del Producto final <b-badge variant="light">${{ SaldoDeuda}}</b-badge>
                            </b-button>
                        </div>
                    </b-col>
                </b-row>
                <br>
                <b-row>
                     <b-col md="6">
                        <multiselect v-model="form.tipoventa"  track-by="nombre" label="nombre" placeholder="Seleccione un tipo de venta" :options="tipoventa" :searchable="true" :allow-empty="false" @input="tipoventainput">
                            <template slot="singleLabel" slot-scope="{ option }"><strong>{{ option.nombre }}</strong></template>
                        </multiselect>
                    </b-col>
                    <b-col md="6">
                        <b-input-group prepend="Contrato" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" v-model="form.contrato" required="required" placeholder="# de contrato">
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                 <b-row>
                <b-col md="6">
                        <b-input-group prepend="% Incremento Producto" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validarPorcentajeNumerico()" v-model="form.porcentajeVenta" required="required" placeholder="Ingrese un porcentaje de invremento">
                        </b-input-group>
                    </b-col>
                </b-row>
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
                <b-row v-if="tipoventa_id==1">
                     <b-col md="6">
                        <b-input-group prepend="Cantidad de Productos" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="number" class="form-control"  v-model="cantidadproducto" required="required" placeholder="Ingrese una cantidad de productos a comprar">
                        </b-input-group>
                    </b-col>
                     <b-col md="6">
                        <b-input-group prepend=" Valor Adicional ($)" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validarAdicionalNumerico()" v-model="adicional" required="required" placeholder="Ingrese un valor adicional">
                        </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="tipoventa_id==1">
                    <b-col md="6">
                        <b-input-group prepend=" Valor Descuento ($)" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validardescuentoNumerico()" v-model="descuento" required="required" placeholder="Ingrese un valor descuento">
                        </b-input-group>
                    </b-col>
                    <b-col md="6">
                         <b-input-group prepend=" Abono ($)" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validarAbonoNumerico()" v-model="abono" required="required" placeholder="Ingrese el abono">
                         </b-input-group>
                    </b-col >
                </b-row> 
                <br>
                <b-row v-if="tipoventa_id=='1'"> 
                    <b-col md="6">
                         <b-input-group prepend="Interés (%)" class="mb-2 mr-sm-2 mb-sm-0">
                                <input type="text" class="form-control" @keyup="validarInteresNumerico()" v-model="interes" required="required" placeholder="Ingrese el Interés">
                         </b-input-group>
                    </b-col>
                    <b-col md="6">                    
                         <b-input-group prepend="Cuota a pagar $" class="mb-2 mr-sm-2 mb-sm-0">
                            <input type="text" class="form-control" @keyup="validarCuotaNumerico()" v-model="cuota" required="required" placeholder="Ingrese la cuota a pagar">
                         </b-input-group>
                    </b-col>
                </b-row>
                <br>
                <b-row v-if="tipoventa_id=='1'">
               
                    <b-col md="6"> 
                         <b-input-group prepend="Fecha Pagar" class="mb-2 mr-sm-2 mb-sm-0">
                            <b-form-datepicker v-model="fecha_pago"  locale="en"></b-form-datepicker>
                         </b-input-group>
                    </b-col>
                </b-row>
                <template v-if="calcularPeriodo != null && calcularPeriodo > 0">
                    <div class="form-group" v-if="cuota">
                          <b-alert show variant="primary"><a class="alert-link"> <center> Pago realizados a un plazo de {{ calcularPeriodo }} mes(es)</center></a></b-alert>
                    </div>
                </template>
                <div class="card-footer">
                    <button type="button" @click="calculate" class="btn btn-sm btn-primary" v-if="fecha_pago"><i class="fas fa-cogs"></i> Calcular</button>
                    <button type="button" @click="reset" class="btn btn-sm btn-warning" v-if="amortizar == true"><i class="fas fa-broom"></i> Limpiar</button>
                </div>
                       
                <br>
                <template v-if="amortizar == true">
                    
                    <div class="row"  v-if="amortizar == true" >
                            
                        <div class="table-responsive">
                            <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Datos de la Amortización Simulador</strong> </center> </b-alert>
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center">Monto Original</th>
                                        <th class="text-center">Abono</th>
                                        <th class="text-center">Numero de Cuotas</th>
                                        <th class="text-center">Interes %</th>
                                        <th class="text-center">Monto Mensual Promedio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">$ {{SaldoDeuda}}</td>
                                        <td class="text-center">$ {{abono}}</td>
                                        <td class="text-center">{{calcularPeriodo}}</td>
                                        <td class="text-center">{{interes}} %</td>
                                        <td class="text-center">$ {{cuota_fija2}} </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button type="button" @click="donwloadPdf" class="btn btn-sm btn-danger" style="float: right;"><i class="nav-icon far fa-file-pdf"></i> Descargar</button>
                            </div> 
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="table-responsive">
                            <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Tabla de Amortización Simulador</strong> </center> </b-alert>

                            <table class="table table-bordered table-hover table-striped ">
                                <thead>
                                    <tr>
                                        <th class="text-center"># Periodos</th>
                                        <th class="text-center">Fecha de pago</th>
                                        <th class="text-center">Saldo inicial</th>
                                        <th class="text-center">Interes</th>
                                        <th class="text-center">Cuota fija</th>
                                        <th class="text-center">Abono al capital</th>     
                                        <th class="text-center">Saldo final</th>      
                                                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(data, index) in arrayData" :key="data.id">
                                        <td class="text-center">{{ index + 1  }}</td>
                                        <td>{{ data.fecha_pago }}</td>  
                                        <td class="text-center">$ {{ data.saldo_inicial }}</td>
                                        <td class="text-center">$ {{ data.interes }}</td>
                                        <td class="text-center">$ {{ data.cuota }}</td>
                                        <td class="text-center">$ {{ data.abono }}</td>
                                        <td class="text-center">$ {{ data.saldo_final }}</td>                 
                                                        
                                    </tr>
                                </tbody>         
                            </table>
                        </div>   
                    </div>
                </template>
                <b-row>
                    <b-col md="2">
                    </b-col>

                    <b-col md="4">
                        <!--<button type="button" @click="postVenta" class="btn btn-sm btn-success" v-if="amortizar == true"><i class="far fa-check-circle"></i> Establecer</button>-->

                        <b-button @click="postVenta"  class="mt-3" variant="outline-success" block v-if="form.cliente && form.producto && form.tipoventa && form.contrato" >Guardar</b-button>
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
                <b-button  class="btn btn-primary login100-form-btn float-right"  @click="showgestion=true" v-b-modal.modal-xl-2 variant="success"> <i class="fas fa-ambulance"></i></b-button>

            </b-col>
        </b-row>
        <br>
        <b-row>
            <div class="test-header" hidden>
                Selecionado:
                <span id="selectedRows" ></span>
            </div>
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
            title="Detalle de la Venta"
        >
            <b-row>
                <b-col md="6">
                    <b-card
                        header="Producto"
                        
                    >
                        <img class="w-75 p-3 mb-1 h-50 d-inline-block" :src="archivo" >
                        <b-card-footer v-for="(item, index) in ventasid" :key="index">
                               <strong>Producto: </strong> <small>{{ nombrearchivo }}</small> 
                               <strong>Cantidad: </strong> <small>{{ item.cantidadproducto }}</small> 
                               <strong>Modelo: </strong> <small>{{ item.modelo }}</small><br> 
                               <strong>Precio c/u: </strong> <small>{{ item.total }}</small>
                               <b-badge v-bind:style="{ color: item.color }" variant="light"> {color}<span class="sr-only"></span></b-badge>
                        </b-card-footer>
                     
                    </b-card>
                </b-col>
                <b-col md="6">
                    <b-card
                        header="Cliente"
                    >
                    
                        <b-card-text  v-for="(item, index) in ventasid" :key="index">
                            <i class="fas fa-address-card"></i>  <small> {{ item.cedula }}</small> <br>
                            <i class="fas fa-user-tie"></i>  <small> {{ item.apellidoPaterno }} {{ item.nombre1 }}</small> <br>
                            <i class="fas fa-phone-square-alt"></i>  <small> {{ item.numero }}</small> <br>
                            <i class="fas fa-envelope-open-text"></i>  <small> {{ item.email }}</small> <br>
                            <i class="fas fa-home"></i> <small> {{ item.direccionDomicilio }}</small> <br>
                            <hr>
                            <strong>Contrato: </strong> <small>#{{ item.contrato }}</small><br>
                            <strong>Fecha Compra: </strong> <small>{{ item.fechacreado }}</small><br> 
                            <strong>Vendedor: </strong> <small>{{ item.users_id }}</small><br>  
                            <strong>Tipo de Venta: </strong> <small>{{ item.tipoventa }}</small><br>
                            <strong>Descuento: </strong> <small>${{ item.descuento }}</small> <br> 
                            <strong>Saldo de la Deuda: </strong> <small>${{ item.saldoDeuda }}</small> 
                        </b-card-text>
                    </b-card>
                </b-col>
            </b-row>
            <br>
            <div>
                <b-tabs content-class="mt-3">
                    <b-tab title="Detalle Producto" active>
                        <div class="table-responsive-xl">
                            <table class="table table-bordered table-hover table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center">Id</th>
                                        <th scope="col" class="text-center">Producto</th>
                                        <th scope="col" class="text-center">Modelo</th>
                                        <th scope="col" class="text-center">Marca</th>
                                        <th scope="col" class="text-center">Precio</th>
                                        <th scope="col" class="text-center">Iva</th>
                                        <th scope="col" class="text-center">Ice</th>
                                        <th scope="col" class="text-center">Total</th>
                                        <th scope="col" class="text-center">Color</th>
                                        <th scope="col" class="text-center">Peso</th>
                                        <th scope="col" class="text-center">Tamaño</th>
                                        <th scope="col" class="text-center">Nota</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in ventasid" :key="index">
                                        <td class="text-center">{{item.venta_id}}</td>
                                        <td class="text-center">{{item.producto}}</td>
                                        <td class="text-center">{{item.modelo}}</td>
                                        <td class="text-center">{{item.marca}}</td>
                                        <td class="text-center">$ {{item.precio}}</td>
                                        <td class="text-center">$ {{item.iva}}</td>
                                        <td class="text-center">$ {{item.ice}}</td>
                                        <td class="text-center">$ {{item.total}}</td>
                                        <td class="text-center">{{item.color}}</td>
                                        <td class="text-center">{{item.peso}} kg.</td>
                                        <td class="text-center">{{item.tamano}} cm.</td>
                                        <td class="text-center">{{item.nota}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </b-tab>
                    <b-tab title="Plan de Amortización" v-if="amortizaciondetalle">
                        <div class="row">

                            
                            <div class="col-2">

                            </div>
                            <div class="col-8">
                                <div class="table-responsive">
                                    <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Parametros Amortización</strong> </center> </b-alert>
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Fecha</th>
                                                <th class="text-center">Monto</th>
                                                <th class="text-center">Numero de Cuotas</th>
                                                <th class="text-center">Interes</th>
                                                <th class="text-center">Monto Mensual Promedio</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(data, index) in amortizaciondetalle" :key="index">
                                                <td class="text-center">{{data.fecha_pago}}</td>
                                                <td class="text-center" v-for="(item, index) in ventasid" :key="index">$ {{item.totalPagar}}</td>
                                                <td class="text-center">{{data.periodo}}</td>
                                                <td class="text-center">{{data.interes}} %</td>
                                                <td class="text-center" >$ {{data.cuota}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-2">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Datos de la Amortización</strong> </center> </b-alert>
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Monto Original</th>
                                                <th class="text-center">Adicionales</th>
                                                
                                                <th class="text-center">Abono</th>
                                                <th class="text-center">Descuento</th>
                                                <th class="text-center">Monto por Cobrar</th>
                                                <th class="text-center">Intereses</th>
                                                <th class="text-center">Total a Pagar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--<tr v-for="(data, index) in amortizaciondetalle" :key="index">-->
                                            <tr v-for="(item, index) in ventasid" :key="index">
                                                <td class="text-center">    $ {{ ((item.valorDeuda + item.descuento)-item.adicional ) }}</td>
                                                <td class="text-center">    $ {{ item.adicional  }}  </td>
                                                <td class="text-center">    $ {{ item.abono  }}  </td>
                                                <td class="text-center">    $ {{ item.descuento  }}  </td>
                                                <td class="text-center">    $ {{item.monto_cobrar}}</td>
                                                <td class="text-center">    $ {{ item.intereses  }}  </td>
                                                <td class="text-center">    $ {{item.totalPagar}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Tabla de  Amortización</strong> </center> </b-alert>
                                    <table class="table table-bordered table-hover table-striped ">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th class="text-center">Fecha</th>
                                                    <th class="text-center">Saldo inicial</th>
                                                    <th class="text-center">Interes</th>
                                                    <th class="text-center">Cuota</th>
                                                    <th class="text-center">Abono Capital</th>     
                                                    <th class="text-center">Saldo final</th>
                                                    <th class="text-center table-primary"  >Saldo Cuota</th>
                                                    <th class="text-center">Estado</th>        
                                                                                        
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(data, index) in cuotasdetalles" :key="index">
                                                    <td class="text-center">{{ data.periodo }}</td>
                                                    <td>{{ data.fecha_pago }}</td>  
                                                    <td class="text-center">$ {{ data.saldo_inicial }}</td>
                                                    <td class="text-center">$ {{ data.interes }}</td>
                                                    <td class="text-center">$ {{ data.cuota }}</td>
                                                    <td class="text-center">$ {{ data.abono }}</td>
                                                    <td class="text-center">$ {{ data.saldo_final }}</td>
                                                    <td class="text-center">$ {{ data.saldo_cuota }}</td>
                                                    <td class="text-center" v-if="data.estado=='PENDIENTE'"> 
                                                        <span class="badge badge-danger">PENDIENTE</span>
                                                    </td>
                                                    <td class="text-center" v-else> 
                                                        <span class="badge badge-success">CANCELADA</span>
                                                    </td>  
                                                                    
                                                                    
                                                </tr>
                                            </tbody>         
                                    </table>
                                </div>
                            </div>
                        </div>
                    </b-tab>
                    <b-tab title="Cuotas" v-if="amortizaciondetalle">
                        <div class="table-responsive">
                            <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Tabla de  Amortización</strong> </center> </b-alert>
                            <button type="button" @click="donwloadPdf2" class="btn btn-sm btn-danger" style="float: right;"><i class="nav-icon far fa-file-pdf"></i> Descargar</button>
                            <table class="table table-bordered table-hover table-striped ">
                                    <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th class="text-center">Fecha</th>
                                            <th class="text-center">Saldo inicial</th>
                                            <th class="text-center">Interes</th>
                                            <th class="text-center">Cuota</th>
                                            <th class="text-center">Abono Capital</th>     
                                            <th class="text-center">Saldo final</th>
                                            <th class="text-center table-primary"  >Saldo Cuota</th>
                                            <th class="text-center">Estado</th>        
                                                                                
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(data, index) in cuotasdetalles" :key="index">
                                            <td class="text-center">{{ data.periodo }}</td>
                                            <td>{{ data.fecha_pago }}</td>  
                                            <td class="text-center">$ {{ data.saldo_inicial }}</td>
                                            <td class="text-center">$ {{ data.interes }}</td>
                                            <td class="text-center">$ {{ data.cuota }}</td>
                                            <td class="text-center">$ {{ data.abono }}</td>
                                            <td class="text-center">$ {{ data.saldo_final }}</td>
                                            <td class="text-center">$ {{ data.saldo_cuota }}</td>
                                            <td class="text-center" v-if="data.estado=='PENDIENTE'"> 
                                                <span class="badge badge-danger">PENDIENTE</span>
                                            </td>
                                            <td class="text-center" v-else> 
                                                <span class="badge badge-success">CANCELADA</span>
                                            </td>  
                                                            
                                                            
                                        </tr>
                                    </tbody>         
                            </table>
                        </div>
                    </b-tab>
                    <b-tab title="Pagos" >
                        <div class="table-responsive">
                            <b-alert show variant="secondary"><center><i class="fas fa-chart-pie"></i> <strong>Recaudaciones</strong> </center> </b-alert>
                            <table class="table table-bordered table-hover table-striped ">
                                    <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th class="text-center">Fecha</th>
                                            <th class="text-center">Documento</th>
                                            <th class="text-center">Forma P.</th>
                                            <th class="text-center">Fecha P.</th>
                                            <th class="text-center">Saldo Anterior</th>     
                                            <th class="text-center">Valor P.</th>    
                                            <th class="text-center">Saldo Actual</th>    
                                            <th class="text-center">Letra</th>  
                                            <th class="text-center">Origen</th>  
                                            <th class="text-center">Destino</th>         
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(data, index) in pagosdetalles" :key="index">
                                            <td class="text-center">{{ data.id }}</td>
                                            <td>{{ data.fecha }}</td>  
                                            <td class="text-center"> {{ data.documento }}</td>
                                            <td class="text-center"> {{ data.formapago }}</td>
                                            <td class="text-center"> {{ data.fechapago }}</td>
                                            <td class="text-center"> {{ data.saldo_anterior }}</td>
                                            <td class="text-center"> {{ data.valor }}</td>
                                            <td class="text-center"> {{ data.saldo_actual }}</td>
                                            <td class="text-center"> {{ data.letra }}</td>
                                            <td class="text-center"> {{ data.origen }}</td>
                                            <td class="text-center"> {{ data.destino }}</td>
                                                            
                                             <td> <b-button class="mt-3" variant="outline-danger" :href="enlacerecibo+data.id+'/'+data.clientes_id+'/'+data.ventas_id" block >Recibo</b-button></td>               
                                        </tr>
                                    </tbody>         
                            </table>
                        </div>
                    </b-tab>
                </b-tabs>
            </div>
            
        
            <b-card no-body class="overflow-hidden" >
                
                    
               
            </b-card>

        </b-modal>


     </div>
</template>

<script>
import axios from 'axios'
import Vue from "vue";
import 'whatwg-fetch';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import MagicVueInput from 'magic-vue-input'
import "ag-grid-community/dist/styles/ag-grid.css";
import "ag-grid-community/dist/styles/ag-theme-balham.css";
import { AgGridVue } from 'ag-grid-vue';
import { AllCommunityModules } from "@ag-grid-community/all-modules";
import swal from 'sweetalert2'
import Multiselect from 'vue-multiselect'

import Loading from 'vue-loading-overlay';

import 'vue-loading-overlay/dist/vue-loading.css';

Vue.use(Loading);

const pluginOptions = {
  /* see config reference */
  globalOptions: { currency: 'USD' }
}
const options = {
    confirmButtonColor: '#41b882',
    cancelButtonColor: '#ff7674',
};

export default  {
    name: 'ventas',
      /*
      Defines the data used by the component
    */components:{
            Loading
        },
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
            isLoading: false,
            isSuccess: false,
            form: {
                cliente: '',
                producto: '',
                tipoventa: 1,
                contrato: '',  
                porcentajeVenta: 0, 
                
            },
            cliente_id: '',
            producto_id: '',
            tipoventa_id: '',
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
          
            show: false,
            showarchivo: null,
            enlace: 'http://app2.datamarketingplus.ec/',
            enlacerecibo: 'http://app2.datamarketingplus.ec/recibodescargar/',
            success: '',
            clientes: [],
            productos: [],
            tipoventa: [],

            /////////////
                adicional: 0.0,
                descuento: 0.0,
                cantidadproducto: 1,
                SaldoDeuda: 0.0,
                abono: 50.00,
                periodo: 0,
                interes: 0.00,
                fecha_pago: '',
                cuota: 50.00,
                errorMostrarMsgPago: [],
                errorPago: 0,
                amortizar: false,
                arrayData : [],
                cuota_fija2: '',
                min: minDate,
                max: maxDate,
                getcuota: null,
                getcuotadetalle: null,

            ///////////////
             
                columnDefs: null,
                rowData: null,
                domLayout: null,
                modules: AllCommunityModules,            
                defaultColDef: null,
                gridApi: null,
                idv: '',
                ventasid: [],
                cuotasdetalles: [],
                amortizaciondetalle: null,
                archivo: null,
                nombrearchivo: '',
                valorDeudaarchivo: '',
               
                ttcreditos: [],
                ttdecontado: [],
                reporteVentas: [],
                cuota_fija: 0.0,
                saldo_cuota2: 0.0,
                getproducto: [],
                pagosdetalles: null
                
        }
    },
    components: {
        AgGridVue,
        Multiselect 
    },
    computed: {
        
        calcularPeriodo() 
            {
                this.SaldoDeuda = this.SaldoDeuda + (this.SaldoDeuda * this.form.porcentajeVenta)/100
                if (this.producto_id) {
                    axios.get(this.enlace+'getProductosVentasPrecio/'+this.producto_id)
                    .then(res => {
                    this.SaldoDeuda = res.data.total;
                  
                    });
                    if (this.cantidadproducto >0) {
                       
                        this.SaldoDeuda  = parseFloat(this.SaldoDeuda) * parseInt(this.cantidadproducto) 
                    }
                    if (this.adicional >0) {
                        this.SaldoDeuda  = parseFloat(this.SaldoDeuda) + parseFloat(this.adicional)
                    }
                    
                     if (this.descuento >0) {
                        this.SaldoDeuda  = parseFloat(this.SaldoDeuda) - parseFloat(this.descuento)

                    }
                    
                    let me = this     
                    me.periodo = Math.round((parseFloat(me.SaldoDeuda) - parseFloat(me.abono)) / parseFloat(me.cuota))
                    return Math.round(me.periodo)
                    
                }
                
            },
     
            
    },
    
    created(){
     
        this.domLayout = "autoHeight";
        
    },
    beforeMount() 
    {

       
            axios.get(this.enlace+'getclientesVentas')
                    .then(res => {
                    this.clientes = res.data;
            });

            

            axios.get(this.enlace+'getProductosVentas')
                .then(res => {
                this.productos = res.data;
                
            });

            axios.get(this.enlace+'gettipoventa')
                .then(res => {
                this.tipoventa = res.data;
            });
        this.gridOptions = {};
        this.columnDefs = [
            {headerName: 'Id', field: 'id'},
            {headerName: '# Contrato', field: 'contrato'},
            {headerName: 'Tipo Venta', field: 'tipoventa'},
            {headerName: 'Cliente', field: 'cedula'},
            {headerName: 'Producto', field: 'producto'},
            {headerName: 'Valor Deuda', field: 'valorDeuda'},
            {headerName: 'Saldo Deuda', field: 'saldoDeuda'},
            {headerName: 'Fecha', field: 'fecha'}
        ];
        this.defaultColDef = {
            //flex: 1,
            cellClass: 'cell-wrap-text',
            autoHeight: true,
            sortable: true,
            resizable: true,
        }
        fetch('getventas')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);

            axios.get(this.enlace+'ttcreditos')
                    .then(res => {
                    this.ttcreditos = res.data;
            });
            axios.get(this.enlace+'ttdecontado')
                    .then(res => {
                    this.ttdecontado = res.data;
            });
            axios.get(this.enlace+'reporteVentas')
                    .then(res => {
                    this.reporteVentas = res.data;
            });
        
    },
    mounted() {
        this.gridApi = this.gridOptions.api;
        this.gridColumnApi = this.gridOptions.columnApi;
    },
    methods: {
        customLabel ({ nombre, modelo }) {
            return `${nombre} – ${modelo}`
        },
        clienteinput(value){
            this.cliente_id = value.id
            
        },
        productoinput(value){
            this.producto_id = value.id
            axios.get(this.enlace+'getproducto/'+this.producto_id )
                    .then(res => {
                    this.getproducto = res.data;
                    
            });
               
        },
        tipoventainput(value){
            this.tipoventa_id = value.id
        },
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
        ////////
        
        nuevaFecha(fecha, intervalo, dma) {
            let arrayFecha = fecha.split('-')
            let anio = arrayFecha[0]
            let mes = arrayFecha[1]
            let dia = arrayFecha[2]  
                
            let fechaInicial = new Date(anio, mes - 1, dia);
            let fechaFinal = fechaInicial;
            if(dma=="m" || dma=="M")
            {
                fechaFinal.setMonth(fechaInicial.getMonth() + parseInt(intervalo));
            }
            else if(dma=="y" || dma=="Y")
            {
                fechaFinal.setFullYear(fechaInicial.getFullYear() + parseInt(intervalo));
            }
            else if(dma=="d" || dma=="D")
            {
                fechaFinal.setDate(fechaInicial.getDate() + parseInt(intervalo));
            }
            else
            {
                return fecha;
            }
            dia = fechaFinal.getDate();
            mes = fechaFinal.getMonth() + 1;
            anio = fechaFinal.getFullYear();
                
            dia = (dia.toString().length == 1) ? "0" + dia.toString() : dia;
            mes = (mes.toString().length == 1) ? "0" + mes.toString() : mes;
                
            return anio + "-" + mes + "-" + dia;
        },
        formatDate(date) {
            let arrayFecha = date.split('-')
            let year = arrayFecha[0]
            let month = arrayFecha[1]
            let day = arrayFecha[2]  
                
            let fecha = new Date(year, month - 1, day);
            let meses = [
                "01", "02", "03",
                "04", "05", "06", "07",
                "08", "09", "10",
                "11", "12"
            ];
            let dia = fecha.getDate();
            let mesIndice = fecha.getMonth();
            let anio = fecha.getFullYear();
            return anio + '-' + meses[mesIndice] + '-' + dia;
        },
        calculate()
        {
            this.getcuota=null
            this.getcuotadetalle=null
            if(this.validate())
            {
                return
            }
            else
            {
                let me = this
                if (me.SaldoDeuda < 0.1)
                {
                    swal(
                        'Error',
                        'El cliente no tiene deuda para crear un plan de pago',
                        'error'
                    )
                }
                else
                {  
                    me.amortizar = true
                    me.arrayData = []
                    
                    let object = {}
                    let monto_cobrar = Math.round(parseFloat(me.SaldoDeuda) - parseFloat(me.abono), 3);
                    if (me.interes >0.0) {
                        let interesDecimal = (parseFloat(me.interes) / 100);
                        let denominador = Math.pow((1 / (1 + parseFloat(interesDecimal))), parseFloat(me.periodo));
                        this.cuota_fija = (parseFloat(interesDecimal) * parseFloat(monto_cobrar)) / (1 - parseFloat(denominador));
                      
                    }else{
                          this.cuota_fija =    me.cuota;
                    }
                    

                    let intereses = 0.0
                    let amortizacion = 0.0
                    let saldo_final = 0.0
                    this.cuota_fija2 = parseFloat(this.cuota_fija).toFixed(2)
                    
                    for (var i = 1; i <= me.periodo; i++) 
                    {      
                        intereses = parseFloat(monto_cobrar) * parseFloat(me.interes / 100)
                        amortizacion = parseFloat(this.cuota_fija) - parseFloat(intereses)
                        saldo_final = parseFloat(monto_cobrar) - parseFloat(amortizacion) 
                        this.saldo_cuota2 = parseFloat(monto_cobrar) - parseFloat(amortizacion)


                        
                        object = {
                            id: i,
                            saldo_inicial: parseFloat(monto_cobrar.toFixed(2)),
                            cuota: parseFloat(this.cuota_fija).toFixed(2),
                            interes: parseFloat(intereses.toFixed(2)),
                            abono: parseFloat(amortizacion.toFixed(2)),
                            fecha_pago: me.formatDate(me.nuevaFecha(me.fecha_pago, '+'+i, 'm')),
                            saldo_final: (parseFloat(saldo_final.toFixed(2)) < 0.1) ? 0 : parseFloat(saldo_final.toFixed(2))                  
                        }
                        me.arrayData.push(object)
                        monto_cobrar = object.saldo_final
                        object = {}

                                   
                        if (saldo_final <= this.cuota_fija) {
                            this.cuota_fija = saldo_final;
                        }else{
                             this.cuota_fija = this.cuota_fija;
                        }
                    }
                }
            }
        },  
        donwloadPdf()
        {
            
            let me = this
            let doc = new jsPDF('p', 'pt');
        
            let columns = [
                {title: "# Periodos", dataKey: "id"},
                {title: "Fecha de pago", dataKey: "fecha_pago"},
                {title: "Saldo inicial", dataKey: "saldo_inicial"},
                {title: "Cuota fija", dataKey: "cuota"},
                {title: "Interés", dataKey: "interes"},
                {title: "Abono", dataKey: "abono"},
                
                {title: "Saldo final", dataKey: "saldo_final"},
            ];
            doc.text('Amortización del cliente ', 10, 18)
            doc.autoTable(columns, me.arrayData)
            doc.save('amortizacion.pdf')
        },
        donwloadPdf2()
        {
            
            let me = this
            let doc = new jsPDF('p', 'pt', 'A4');
        
        
            let columns = [
                {title: "# Periodos", dataKey: "id"},
                {title: "Fecha de pago", dataKey: "fecha_pago"},
                {title: "Saldo inicial", dataKey: "saldo_inicial"},
                {title: "Interés", dataKey: "interes"},
                {title: "Cuota fija", dataKey: "cuota"},
                {title: "Abono Capital", dataKey: "cuota"},
                {title: "Saldo final", dataKey: "saldo_final"},
                {title: "saldo_cuota", dataKey: "saldo_cuota"},
               
            ];
            doc.text('Tabla de Amortización  cliente ', 10, 18)
         
            doc.autoTable(columns, me.cuotasdetalles)

            doc.save('amortizacion.pdf')
        },
        postVenta()
        {
        this.isLoading = true;
        this.isSuccess = false;
            if (this.tipoventa_id==1) {
            
                if(this.validate())
                {
                    return
                }
                else
                {
                    let me = this
                    if (me.SaldoDeuda < 0.1)
                    {
                        swal(
                            'Error',
                            'El cliente no tiene deuda para crear un plan de pago',
                            'error'
                        )
                    }
                    else
                    {
                       
                        let montoDeuda = parseFloat(me.SaldoDeuda);
                        
                        let monto_cobrar = parseFloat(me.SaldoDeuda) - parseFloat(me.abono);

                        if (me.interes >0.0) {
                            let interesDecimal = (parseFloat(me.interes) / 100);
                            let denominador = Math.pow((1 / (1 + parseFloat(interesDecimal))), parseFloat(me.periodo));
                            this.cuota = (parseFloat(interesDecimal) * parseFloat(monto_cobrar)) / (1 - parseFloat(denominador));
                            }else{
                            this.cuota=    me.cuota;
                        }
                    

                        const parametross ={
                            'cliente_id':   (this.cliente_id),
                            'contrato':     (this.form.contrato),
                            'producto_id':  (this.producto_id),
                            'tipoventa_id': (this.tipoventa_id),
                            'porcentajeVenta': (this.form.porcentajeVenta),
                            'periodo': me.periodo,
                            'interes': me.interes,
                            'cuota': parseFloat(this.cuota).toFixed(2),
                            'abono': me.abono,
                            'fecha_pago': me.fecha_pago,
                            'monto_cobrar' : monto_cobrar,
                            'montodeuda' : montoDeuda,
                            //'saldoDeuda': me.SaldoDeuda,
                            'detalleCuota': me.arrayData,
                            'adicional': me.adicional,
                            'descuento': me.descuento,
                            'cantidadproducto': me.cantidadproducto,
                        }
                       
                        axios.post(this.enlace+'cuotas', parametross)
                            .then(res => {
                            this.showgestion = false
                            swal(
                                'Correcto',
                                res.data.success,
                                'success'
                            )
                            this.getdatosventa()
                            me.resetError()
                            me.reset()
                            monto_cobrar = 0.0
                            interesDecimal = 0.0
                            this.cantidadproducto = 1
                            this.adicional = 0.0
                            this.descuento = 0.0
                            this.abono = 0.0
                            cuota = 0.0
                        }).finally(()=> this.isLoading= false)
                        .catch(err => {
                            console.log(err.response.data)
                            me.amortizar = false
                            monto_cobrar = 0.0
                            interesDecimal = 0.0
                            this.cantidadproducto = 1
                            this.adicional = 0.0
                            this.descuento = 0.0
                            this.abono = 0.0
                            cuota = 0.0
                            swal(
                                'Error',
                                err.response.data,
                                'error'
                            )
                        }).finally(()=> this.isLoading= false);
                    }
                }    
            }else{
                
                const parametros ={
                            'cliente_id':   (this.cliente_id),
                            'contrato':     (this.form.contrato),
                            'producto_id':  (this.producto_id),
                            'tipoventa_id': (this.tipoventa_id),
                            'saldoDeuda': this.SaldoDeuda,
                            'porcentajeVenta': (this.form.porcentajeVenta),
                            'cantidadproducto': (this.cantidadproducto)
                            
                        }

                        axios.post(this.enlace+'cuotas', parametros)
                            .then(res => {
                            this.showgestion = false
                            swal(
                                'Correcto',
                                res.data.success,
                                'success'
                            )
                            this.getdatosventa()
                            me.amortizar = false
                            monto_cobrar = 0.0
                            interesDecimal = 0.0
                            this.cantidadproducto = 1
                            this.adicional = 0.0
                            this.descuento = 0.0
                            this.abono = 0.0
                            
                            this.resetError()
                            
                            this.reset()
                        }).finally(()=> this.isLoading= false).catch(err => {
                            console.log(err.response.data)
                            
                            swal(
                                'Error',
                                err.response.data,
                                'error'
                            )
                        }).finally(()=> this.isLoading= false);
            }
        },
        deletePago(id)
        {
            swal({
                title: '¿Seguro que quieres eliminar el pago?',
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
                    axios.delete(me.url+'apipago/'+id)
                    .then( res => {
                        me.getPagos()
                        swal(
                        'Borrarlo!',
                        'Pago eliminado.',
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
        },
        validarAdicionalNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.adicional.length; i++)
            if (filtro.indexOf(this.adicional.charAt(i)) != -1) 
                out += this.adicional.charAt(i)
            this.adicional = out
        },
        validarPorcentajeNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.form.porcentajeVenta.length; i++)
            if (filtro.indexOf(this.form.porcentajeVenta.charAt(i)) != -1) 
                out += this.form.porcentajeVenta.charAt(i)
            this.form.porcentajeVenta = out
        },
        validardescuentoNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.descuento.length; i++)
            if (filtro.indexOf(this.descuento.charAt(i)) != -1) 
                out += this.descuento.charAt(i)
            this.descuento = out
        },
        validarValorNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.saldoDeuda.length; i++)
            if (filtro.indexOf(this.saldoDeuda.charAt(i)) != -1) 
                out += this.saldoDeuda.charAt(i)
            this.saldoDeuda = out
        },
        validarAbonoNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.abono.length; i++)
            if (filtro.indexOf(this.abono.charAt(i)) != -1) 
                out += this.abono.charAt(i)
            this.abono = out
        },
        validarCuotaNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.cuota.length; i++)
            if (filtro.indexOf(this.cuota.charAt(i)) != -1) 
                out += this.cuota.charAt(i)
            this.cuota = out
        },
        validarInteresNumerico()
        {
            let out = ''
            let filtro = '1234567890.'
            
            for (let i=0; i < this.interes.length; i++)
            if (filtro.indexOf(this.interes.charAt(i)) != -1) 
                out += this.interes.charAt(i)
            this.interes = out
        },
        resetError()
        {
            this.errorMostrarMsgPago = []
            this.errorPago = 0
        },
        reset()
        {
            let me = this
            me.fecha_pago = ''
            me.periodo = 0
            me.abono = 0.0
            me.interes = 0.0
            me.cuota = 0.0
            me.arrayData = []
            me.amortizar = false,
            me.form.contrato = '',
            me.form.producto = '',
            me.form.cliente = '',
            me.form.tipoventa = '',
            me.tipoventa_id = '',
            me.adicional = '',
            me.cantidadproducto = '',
            me.descuento = ''
            
        },
        validate () 
        {
            
            this.errorPago = 0
            this.errorMostrarMsgPago = []
            if(!this.cantidadproducto > 0) this.errorMostrarMsgPago.push("El abono no puede estar vacío")
            if(!this.abono || this.abono < 0) this.errorMostrarMsgPago.push("El abono no puede estar vacío")
            if(!this.periodo || this.periodo <= 0 || this.periodo == 'Infinity') this.errorMostrarMsgPago.push("El periodo no puede estar vacío")
            if(!this.cuota || this.cuota <= 0) this.errorMostrarMsgPago.push("Debe especificar la cuota")
            if(!this.interes ) this.errorMostrarMsgPago.push("El interés no puede estar vacío ni ser menor o igual a 0")
            if(!this.fecha_pago) this.errorMostrarMsgPago.push("La fecha de pago no puede estar vacío")
            
            if (this.errorMostrarMsgPago.length) this.errorPago = 1
            return this.errorPago
        },
        onSelectionChanged() {
           
            var selectedRows = this.gridApi.getSelectedRows();
            var selectedRowsString = '';
            var id_clientes = '';
            var tipoventaId = '';
            this.amortizaciondetalle = null;
            var maxToShow = 155;
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
                this.archivo = "http://app2.datamarketingplus.ec/"+selectedRowsString
            }
            
            if (selectedRows.length > maxToShow) {
                var othersCount = selectedRows.length - maxToShow;
                selectedRowsString +=
                ' and ' + othersCount + ' other' + (othersCount !== 1 ? 's' : '');
            }
            document.querySelector('#selectedRows').innerHTML = selectedRowsString;
            selectedRows.forEach(element => {
                this.idv = element.id;
                this.tipoventaId = element.tipoventa;
                this.id_clientes = element.id_clientes;
                this.nombrearchivo = element.producto;
                this.valorDeudaarchivo = element.valorDeuda;
              
            });
               
                axios.get(this.enlace+'getventasid/'+this.idv)
                    .then(res => {
                    this.ventasid = res.data;
                });
                if ( this.tipoventaId=='CREDITO') {
                    axios.get(this.enlace+'amortizaciondetalle/'+this.idv)
                        .then(res => {
                        this.amortizaciondetalle = res.data;
                    });

                    axios.get(this.enlace+'cuotaid/'+this.idv)
                        .then(res => {
                        this.cuotasdetalles = res.data;
                    });
                }
                /**
                 * PAGOS
                 */
               
                axios.get(this.enlace+'pagosdetalle/'+this.idv)
                        .then(res => {
                        this.pagosdetalles = res.data;
                    });

            this.show=true
        },
        getdatosventa(){
            fetch('getventas')
            .then(result => result.json())
            .then(rowData => this.rowData = rowData);

           

            axios.get(this.enlace+'ttcreditos')
                    .then(res => {
                    this.ttcreditos = res.data;
            });
            axios.get(this.enlace+'ttdecontado')
                    .then(res => {
                    this.ttdecontado = res.data;
            });
            axios.get(this.enlace+'reporteVentas')
                    .then(res => {
                    this.reporteVentas = res.data;
            });
             
        }
       
        
    }
}
</script>