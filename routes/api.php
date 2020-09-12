<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/buku','Api\BukuController@index');
Route::post('/buku','Api\BukuController@create');
Route::get('/buku/{id}','Api\BukuController@read');
Route::patch('/buku/{id}', 'Api\BukuController@update');
Route::delete('/buku/{id}','Api\BukuController@delete');
