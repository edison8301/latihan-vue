<?php

namespace App\Http\Controllers\Api;

use App\Models\Buku;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class BukuController extends Controller
{
    public function index(Request $request)
    {
        $query = Buku::query();

        $query->with('kategori');
        $query->with('penulis');
        $query->with('penerbit');

        if($request->get('id_kategori') != null) {
            $query->where('id_kategori', $request->get('id_kategori'));
        }

        if($request->get('id_penerbit') != null) {
            $query->where('id_penerbit', $request->get('id_penerbit'));
        }

        if($request->get('id_penulis') != null) {
            $query->where('id_penulis', $request->get('id_penulis'));
        }

        if($request->get('judul') != null) {
            $query->where('judul', 'like', '%'.$request->get('judul').'%');
        }

        return $query->get();
    }

    public function read($id)
    {
        $model = Buku::find($id);

        if($model === null) {
            return response()->json(['message' => 'Not Found!'], 404);
        }

        return $model;
    }
}
