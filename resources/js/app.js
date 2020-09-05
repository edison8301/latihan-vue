import Vue from 'vue';
import './bootstrap';
import Vuetify from "vuetify";
import 'vuetify/dist/vuetify.min.css';

window.Vue = Vue;

Vue.use(Vuetify);
Vue.component('example-component',require('./components/ExampleComponent.vue').default);

var app = new Vue({
    el: '#app',
    data: {
        message: 'Hello World',
        nama: 'Thomas',
        kegiatanBaru: '',
        daftarKegiatan: [
            'Kegiatan 1',
            'Kegiatan 2',
            'Kegiatan 3'
        ]
    },
    methods: {
        tambahKegiatan: function () {
            //alert(this.kegiatanBaru);
            this.daftarKegiatan.push(this.kegiatanBaru);
            this.kegiatanBaru = '';
        }
    }
});
