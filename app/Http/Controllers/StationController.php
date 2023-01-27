<?php

namespace App\Http\Controllers;

use App\Models\Station;
use Illuminate\Http\Request;

class StationController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin')->except(['index', 'show']);
    }

    public function index()
    {
        $stations = Station::all()->pluck('id', 'name');
        $response = [
            'stations' => $stations
        ];

        return response()->json($response, 200);
    }

    public function show($id)
    {
        $station = Station::find($id);
        if (!$station) {
            return response()->json(['message' => 'Station not found'], 404);
        }

        $response = [
            'id' => $station->id,
            'name' => $station->name,
        ];

        return response()->json($response, 200);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|unique:stations,name',
        ]);

        $station = Station::create($request->all());

        $response = [
            'id' => $station->id,
            'name' => $station->name,
        ];

        return response()->json($response, 201);
    }

    public function update(Request $request, $id)
    {
        $station = Station::find($id);
        if (!$station) {
            return response()->json(['message' => 'Station not found'], 404);
        }

        $fields = $this->validate($request, [
            'name' => 'required|unique:stations,name,' . $id,
        ]);

        $station->update([
            'name' => $fields['name'],
        ]);

        $response = [
            'id' => $station->id,
            'name' => $station->name,
        ];

        return response()->json($response, 200);
    }

    public function destroy($id)
    {
        $station = Station::find($id);
        if (!$station) {
            return response()->json(['message' => 'Station not found'], 404);
        }
        
        if ($station->trips()->count() > 0) {
            return response()->json(['message' => 'Station is used in a trip'], 400);
        }

        $station->delete();

        return response()->json(['message' => 'Station deleted'], 200);
    }
}
