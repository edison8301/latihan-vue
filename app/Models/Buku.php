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

    public function kategori()
    {
        return $this->hasOne(Kategori::class,'id','id_kategori');
    }

    public function penulis()
    {
        return $this->hasOne(Penulis::class,'id','id_penulis');
    }

    public function penerbit()
    {
        return $this->hasOne(Penerbit::class,'id','id_penerbit');
    }
}
