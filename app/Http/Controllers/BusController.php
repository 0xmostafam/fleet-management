<?php

namespace App\Http\Controllers;

use App\Models\Bus;
use Illuminate\Http\Request;

class BusController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin');
    }

    public function store(Request $request)
    {
        $fields = $this->validate($request, [
            'name' => 'required|unique:bus,name',
        ]);

        $bus = Bus::create([
            "name" => $fields["name"]
        ]);
        
        $busSeats = [];
        for ($i = 1; $i <= 12; $i++) {
            $busSeats[] = [
                'bus_id' => $bus->id,
                'seat_number' => $i,
            ];
        }

        $bus->seats()->createMany($busSeats);
        $response = [
            'id' => $bus->id,
            'name' => $bus->name,
        ];

        return response()->json($response, 201);
    }

    public function update(Request $request, $id)
    {
        $bus = Bus::find($id);
        if (!$bus) {
            return response()->json(['message' => 'Bus not found'], 404);
        }

        $fields = $this->validate($request, [
            'name' => 'required|unique:bus,name,' . $bus->id,
        ]);

        $bus->update([
            "name" => $fields["name"]
        ]);

        $response = [
            'id' => $bus->id,
            'name' => $bus->name,
        ];

        return response()->json($response, 200);
    }

    public function destroy($id)
    {
        $bus = Bus::find($id);
        if (!$bus) {
            return response()->json(['message' => 'Bus not found'], 404);
        }

        $trips = $bus->trips()->get();
        if ($trips->count() > 0) {
            return response()->json(['message' => 'Bus has trips'], 400);
        }
        
        $bus->delete();

        return response()->json(['message' => 'Bus deleted'], 200);
    }
}
