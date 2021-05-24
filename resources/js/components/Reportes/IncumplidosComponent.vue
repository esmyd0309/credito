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
                      
                    </tr>
                </tbody>
            </table>
        </div>
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
                incumplidos: null
            }
        },
        created(){
     
            axios.get('reporte/incumplidos')
                        .then(res => {
                        this.incumplidos = res.data;
                    });
        
        },
         methods: {


         }
    }
</script>