
@extends('layouts.main')

@section('content')

    <div id="app">
        <h1>@{{ message }}</h1>

        <table border="1">
            <tr>
                <th>Judul</th>
                <th>Kategori</th>
                <th>Penerbit</th>
                <th>Penulis</th>
                <th>Tahun Terbit</th>
            </tr>
            <tr v-for="buku in arrayBuku">
                <td>@{{ buku.judul }}</td>
                <td style="text-align: center">@{{ buku.kategori != undefined ? buku.kategori.nama : '' }}</td>
                <td style="text-align: center">@{{ buku.penerbit != undefined ? buku.penerbit.nama : '' }}</td>
                <td style="text-align: center">@{{ buku.penulis != undefined ? buku.penulis.nama : '' }}</td>
                <td style="text-align: center">@{{ buku.tahun_terbit }}</td>
            </tr>
        </table>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: 'Hello World',
                arrayBuku: []
            },
            mounted() {
                /*
                axios.get("<?= url('/api/buku'); ?>").then(function(response) {
                    console.log(response.data);
                    app.arrayBuku = response.data;
                });
                */
                axios.get("<?= url('/api/buku'); ?>").then((response) => {
                    console.log(response.data);
                    this.arrayBuku = response.data;
                });
            },
            /*
            mounted: function () {
                axios.get("<?= url('/api/buku'); ?>").then(function(response) {
                    console.log(response.data);
                    app.arrayBuku = response.data;
                });
            }
            */
        });
    </script>
@endsection
