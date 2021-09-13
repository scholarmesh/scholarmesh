<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PagesController;
use Illuminate\Filesystem\Filesystem;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
  //
})->middleware('auth');

Route::view('/login', 'login')->name('login');

Route::get('/event', [EventController::class, 'show']);
Route::get('/eventform', [EventController::class, 'index']);
Route::post('/makeevent', [EventController::class, 'makeEvent'])->name('makeevent');
