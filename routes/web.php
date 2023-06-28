<?php

use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\UserController;
use App\Models\Report;
use App\Models\Result;

// use Illuminate\Support\Facades\Http;

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
Route::get('/', [QuestionController::class, 'index'])->name('home')->withoutMiddleware('auth');

// Route::get('/test', function(){

// });

Route::middleware('auth')->group(function () {
    Route::get('/masuk', [UserController::class, 'index'])->name('login')->withoutMiddleware('auth');
    Route::post('/masuk', [UserController::class, 'login'])->withoutMiddleware('auth');

    Route::get('/daftar', [UserController::class, 'create'])->name('register')->withoutMiddleware('auth');
    Route::post('/daftar', [UserController::class, 'register'])->withoutMiddleware('auth');

    Route::get('/tes', [QuestionController::class, 'create'])->name('test');

    Route::post('/hasil', [QuestionController::class, 'store'])->name('result');

    Route::get('/print/{id}', function($id){
        $id = dec($id);
        $test = Report::find($id);

        $data = [
            'tes'   => $test,
            'ket'   => Result::where('mbti', $test['result'])->first(),
        ];

        return view('users.print', $data);
    });

    Route::prefix('pengguna')->name('users.')->group(function () {
        Route::get('/dashboard', [UserController::class, 'show'])->name('dashboard');
        Route::get('/profil', [UserController::class, 'edit'])->name('profile');
        Route::post('/profil', [UserController::class, 'update'])->name('profile_update');
    });

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::get('/dashboard', [AdminController::class, 'index'])->name('dashboard');
        Route::get('/hasil', [AdminController::class, 'report'])->name('report');
        Route::get('/akun-pengguna', [AdminController::class, 'users'])->name('users');

        Route::post('/daftar', [AdminController::class, 'register'])->name('register');
    });

    Route::get('/keluar', [UserController::class, 'logout'])->name('logout');
});
