<?php

use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BusController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\StationController;
use App\Http\Controllers\TripController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// User Routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Protected routes
Route::middleware('auth:sanctum')->group(function () {

    // User Routes
    Route::post('/logout', [AuthController::class, 'logout']);
    
    // Create Admin Routes
    Route::post('/admin/register/', [AdminAuthController::class, 'createAdmin']);

    // Stations routes
    Route::resource('/stations', StationController::class)->except(['create', 'edit']);

    // Trip routes
    Route::resource('/trips', TripController::class)->except(['create', 'edit']);

    // Bus Routes
    Route::resource('/buses', BusController::class)->except(['index', 'show', 'create', 'edit']);

    // reservations routes group
    Route::prefix('/reservations')->group(function () {
        Route::get('/', [ReservationController::class, 'index']);
        Route::get('/start/{start_station}/end/{end_station}', [ReservationController::class, 'listReservations']);
        Route::post('book', [ReservationController::class, 'book']);
    });
});
