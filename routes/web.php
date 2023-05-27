<?php

use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\UserController;
use App\Models\Question;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

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
Route::get('/', function () { return view('users.home'); })->name('home');

Route::get('/test', function(){
    // dd (Auth::user()->isAdmin == 1);
});

Route::middleware('auth')->group(function () {
    Route::get('/login', [UserController::class, 'index'])->name('login')->withoutMiddleware('auth');
    Route::post('/login', [UserController::class, 'login'])->withoutMiddleware('auth');

    Route::get('/register', [UserController::class, 'create'])->name('register')->withoutMiddleware('auth');
    Route::post('/register', [UserController::class, 'register'])->withoutMiddleware('auth');

    Route::get('/mulai-test-mbti', [QuestionController::class, 'index'])->name('test');
    Route::post('/hasil', [QuestionController::class, 'calculate']);

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::get('/dashboard', [AdminController::class, 'index'])->name('dashboard');
        Route::post('/register', [AdminController::class, 'register']);

        Route::get('/post', function () { return view('admin.post'); })->name('post');
        Route::get('/post/add', function () { return view('admin.post'); })->name('post.add');
        Route::get('/post/edit/{id}', [PostController::class, 'edit'])->name('post.edit');
        Route::post('/post/edit/{id}', [PostController::class, 'update']);
        Route::post('/post/add', [PostController::class, 'store']);

        Route::get('/report', function () { return view('admin.report'); })->name('report');
        Route::get('/questions', function () { return view('admin.questions'); })->name('questions');
    });

    Route::get('/logout', [UserController::class, 'logout'])->name('logout');
});
