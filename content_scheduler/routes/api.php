<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Platform\PlatformController;
use App\Http\Controllers\Post\PostController;
use App\Http\Controllers\Dashboard\DashboardController;
use App\Http\Controllers\Dashboard\ActivityLogController;




/*
|--------------------------------------------------------------------------
| API Routes
|---------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Authentication routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Displaying all platforms should generally be public.
Route::get('/platforms', [PlatformController::class, 'index']);

Route::middleware('auth:sanctum')->group(function () {
    // Protected routes
    Route::get('/profile', [AuthController::class, 'profile']);
    Route::put('/profile', [AuthController::class, 'updateProfile']);
    Route::post('/logout', [AuthController::class, 'logout']);

    
    // Create a new platform
    Route::post('/platforms', [PlatformController::class, 'store']);
    // Update a platform
    Route::put('/platforms/{id}', [PlatformController::class, 'update']);
    //Delete a platform
    Route::delete('/platforms/{id}', [PlatformController::class, 'destroy']);
    //Toggle platforms
    Route::post('/platforms/toggle', [PlatformController::class, 'togglePlatform']);

    // Posts routes 
    Route::get('/posts', [PostController::class, 'index']);
    Route::post('/posts', [PostController::class, 'store']);
    Route::put('/posts/{id}', [PostController::class, 'update']);
    Route::delete('/posts/{id}', [PostController::class, 'destroy']);
    Route::get('/posts/scheduled-count', [PostController::class, 'scheduledCount']);

    // Dashboard route
    Route::get('/dashboard/stats', [DashboardController::class, 'stats']);

    Route::get('/activity-logs', [ActivityLogController::class, 'index']);

});
