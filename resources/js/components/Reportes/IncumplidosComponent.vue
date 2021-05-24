<template>
    <div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <th class="text-center">Cantidad</th>
                        <th class="text-center">Valor</th>
                        <th class="text-center">Fecha</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(data, index) in incumplidos" :key="index">
                        <td class="text-center"> {{data.CANTIDAD}}</td>
                        <td class="text-center">$ {{data.PENDIENTE}}</td>
                        <td class="text-center">{{data.fecha_pago}}</td>
                        <td><button type="button" @click="detalleincumplido(data.fecha_pago)" class="btn btn-danger" ><i class="fas fa-trash-alt"></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>

         <b-modal 
            v-model="show"  
            id="modal-xl" 
            size="xl" 
            title="Detalle de la Venta"
        >
           
                <b-tabs content-class="mt-3">
                    <b-tab title="Detalle Producto" active>
                        <div class="table-responsive-xl">
                            <table class="table table-bordered table-hover table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center"># Cuotas Pendientes</th>
                                        <th scope="col" class="text-center">Valores  Pendientes</th>
                                        <th scope="col" class="text-center">Cliente</th>
                                        <th scope="col" class="text-center">Numero Telefono</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in incumplidosdetalles" :key="index">
                                        <td class="text-center">{{item.cantidad}}</td>
                                        <td class="text-center">{{item.valorpendiente}}</td>
                                        <td class="text-center">{{item.cedula}}</td>
                                        <td class="text-center">{{item.numero}}</td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </b-tab>
                   
                </b-tabs>
         
            
        
            <b-card no-body class="overflow-hidden" >
                
                    
               
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



    export default  {
        
        data() {
            return {
                incumplidos: null,
                incumplidosdetalles: null,
                show: false
            }
        },
        created(){
     
            axios.get('reporte/incumplidos')
                        .then(res => {
                        this.incumplidos = res.data;
                    });
        
        },
         methods: {

            detalleincumplido(values){
                this.incumplidosdetalles= null;
                this.show = true;
                 console.log(values);
                axios.get('reporte/detalleincumplido/'+values)
                        .then(res => {
                        this.incumplidosdetalles = res.data;
                        console.log(this.incumplidosdetalles);
                    });
        
        
            }
         }
    }
</script>