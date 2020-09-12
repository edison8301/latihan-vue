<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    protected $table = 'buku';

    protected $fillable = [
        'judul',
        'id_kategori',
        'id_penulis',
        'id_penerbit',
        'sinopsis',
        'tahun_terbit'
    ];
}
