<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\Trip;
use Illuminate\Http\Request;

class TripController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin')->except(['index', 'show']);
    }

    public function index()
    {
        $trips = Trip::with('tripStops')->get()->map(function ($trip) {
            return [
                'id' => $trip->id,
                'name' => $trip->name(),
                'bus' => $trip->bus->name,
                'start_station' => $trip->startStation->name,
                'end_station' => $trip->endStation->name,
                'start_time' => $trip->start_time,
                'end_time' => $trip->end_time,
                'stops' => $trip->tripStops->map(function ($stop) {
                    return [
                        'id' => $stop->id,
                        'order' => $stop->order,
                        'name' => $stop->name(),
                    ];
                }),
            ];
        });
        $response = [
            'trips' => $trips
        ];

        return response()->json($response, 200);
    }

    public function show($id)
    {
        $trip = Trip::with('tripStops')->find($id);
        if (!$trip) {
            return response()->json(['message' => 'Trip not found'], 404);
        }

        $response = [
            'id' => $trip->id,
            'name' => $trip->name(),
            'bus' => $trip->bus->name,
            'start_station' => $trip->startStation->name,
            'end_station' => $trip->endStation->name,
            'start_time' => $trip->start_time,
            'end_time' => $trip->end_time,
            'stops' => $trip->tripStops->map(function ($stop) {
                return [
                    'id' => $stop->id,
                    'order' => $stop->order,
                    'name' => $stop->name(),
                ];
            }),
        ];

        return response()->json($response, 200);
    }

    public function store(Request $request)
    {
        $fields = $this->validate($request, [
            'bus_id' => 'required|exists:buses,id',
            'start_time' => 'required|date_format:Y-m-d H:i:s',
            'end_time' => 'required|date_format:Y-m-d H:i:s',
            'stops' => 'required|array|min:2',
            'stops.*' => 'required|numeric|exists:stations,id|distinct',
        ]);

        // check if this bus have a trip at the same interval time
        $trip = Trip::where('bus_id', $fields['bus_id'])
            ->where(function ($query) use ($fields) {
                $query->whereBetween('start_time', [$fields['start_time'], $fields['end_time']])
                    ->orWhereBetween('end_time', [$fields['start_time'], $fields['end_time']]);
            })
            ->first();

        if ($trip) {
            return response()->json(['message' => 'This bus have a trip at the same interval time'], 400);
        }

        $trip = Trip::create([
            'bus_id' => $fields['bus_id'],
            'start_time' => $fields['start_time'],
            'end_time' => $fields['end_time'],
            'start_station_id' => $fields['stops'][0],
            'end_station_id' => $fields['stops'][count($fields['stops']) - 1],
        ]);

        $trip->tripStops()->createMany($fields["stops"]);
        
        $response = [
            'id' => $trip->id,
            'name' => $trip->name(),
            'bus' => $trip->bus->name,
            'start_station' => $trip->startStation->name,
            'end_station' => $trip->endStation->name,
            'start_time' => $trip->start_time,
            'end_time' => $trip->end_time,
        ];

        return response()->json($response, 201);
    }

    public function update(Request $request, $id)
    {
        $trip = Trip::find($id);
        if (!$trip) {
            return response()->json(['message' => 'Trip not found'], 404);
        }

        $fields = $this->validate($request, [
            'bus_id' => 'required|exists:buses,id',
            'start_time' => 'required|date_format:Y-m-d H:i:s',
            'end_time' => 'required|date_format:Y-m-d H:i:s',
            'stops' => 'required|array',
            'stops.*' => 'required|numeric|exists:stations,id|distinct',
        ]);

        $trip = Trip::where('bus_id', $fields['bus_id'])
            ->where(function ($query) use ($fields) {
                $query->whereBetween('start_time', [$fields['start_time'], $fields['end_time']])
                    ->orWhereBetween('end_time', [$fields['start_time'], $fields['end_time']]);
            })
            ->first();

        if ($trip) {
            return response()->json(['message' => 'This bus have a trip at the same interval time'], 400);
        }

        $reservation = Reservation::where('trip_id', $id)->first();
        
        if ($reservation) {
            return response()->json(['message' => 'This trip have a reservation'], 400);
        }

        $trip->update([
            'bus_id' => $fields['bus_id'],
            'start_time' => $fields['start_time'],
            'end_time' => $fields['end_time'],
            'start_station_id' => $fields['stops'][0],
            'end_station_id' => $fields['stops'][count($fields['stops']) - 1],
        ]);

        $trip->tripStops()->delete();
        $trip->tripStops()->createMany($fields["stops"]);
        
        $response = [
            'id' => $trip->id,
            'name' => $trip->name(),
            'bus' => $trip->bus->name,
            'start_station' => $trip->startStation->name,
            'end_station' => $trip->endStation->name,
            'start_time' => $trip->start_time,
            'end_time' => $trip->end_time,
        ];

        return response()->json($response, 200);
    }

    public function destroy($id)
    {
        $trip = Trip::find($id);
        if (!$trip) {
            return response()->json(['message' => 'Trip not found'], 404);
        }

        $reservation = Reservation::where('trip_id', $id)->first();
        
        if ($reservation) {
            return response()->json(['message' => 'This trip have a reservation'], 400);
        }

        $trip->delete();
        $trip->tripStops()->delete();

        return response()->json(['message' => 'Trip deleted'], 200);
    }
}
