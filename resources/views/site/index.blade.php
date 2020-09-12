
@extends('layouts.main')


@section('content')


    <div id="app">
        <div>
            @{{ message }} @{{ nama }}
        </div>
        <div>
            Imperaetive <div id="div-nama"></div>
        </div>

        <div>
            <input v-model="nama" id="tes">
        </div>

        <div>&nbsp;</div>

        <div>
            <input v-model="kegiatanBaru">
            <button onclick="app.tambahKegiatan()">Tambah</button>
        </div>

        <div>
            Daftar Kegiatan
            <ol>
                <li v-for="kegiatan in daftarKegiatan">
                    @{{ kegiatan }}
                </li>
            </ol>

        </div>


        <div>

        </div>



    </div>


    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

    <script>
        Vue.component('todo-item', {
            props: ['tes'],
            template: '<li>This is a todo: @{{ tes }}</li>'
        });

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

        document.getElementById('tes').onkeyup = function () {
            let isi = document.getElementById('tes').value;
            //alert(isi);
            document.getElementById('div-nama').innerHTML = isi;
        };


    </script>





@endsection
