<?php

namespace App\Http\Controllers;

use App\Models\Station;
use Illuminate\Http\Request;

class StationController extends Controller
{
    public function index()
    {
        $stations = Station::all()->pluck('id', 'name');
        $response = [
            'stations' => $stations
        ];

        return response()->json($response, 200);
    }
}
