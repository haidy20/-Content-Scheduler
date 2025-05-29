<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\PostWebController;
use Illuminate\Support\Facades\Auth;


Route::get('/', function () {
    return view('welcome');
});

// // Login page
// Route::get('/login', function () {
//     return view('auth.login');
// })->name('login');


// // Logout page
// Route::post('/logout', function () {
//     Auth::logout();
//     return redirect('/login');
// })->name('logout');


// // Posts - Web frontend routes
// Route::get('/posts/create', [PostWebController::class, 'create'])->name('posts.create');
// Route::post('/posts', [PostWebController::class, 'store'])->name('posts.store');
// Route::get('/dashboard', [PostWebController::class, 'index'])->name('dashboard.index');
// Route::get('/posts/{id}/edit', [PostWebController::class, 'edit'])->name('posts.edit');
// Route::put('/posts/{id}', [PostWebController::class, 'update'])->name('posts.update');
// Route::delete('/posts/{id}', [PostWebController::class, 'destroy'])->name('posts.destroy');

// // Settings page for managing platforms
// Route::get('/settings', [PostWebController::class, 'settings'])->name('settings');
// Route::post('/platforms/toggle', [PostWebController::class, 'toggle'])->name('platforms.toggle');
