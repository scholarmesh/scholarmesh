<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\EventController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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

Route::get('/', [HomeController::class], 'show')->middleware('auth');


Route::view('/login', 'login')->name('login');
Route::view('/signup', 'signup')->name('signup');
Route::post('/signup', [UserController::class, 'create']);

Route::get('/event', [EventController::class, 'show']);
Route::get('/eventform', [EventController::class, 'index']);
Route::post('/makeevent', [EventController::class, 'makeEvent'])->name('makeevent');
