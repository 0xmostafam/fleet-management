<?php

namespace App\Http\Controllers;

use App\Models\BusSeat;
use App\Models\Trip;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ReservationController extends Controller
{
    public function index($startStation, $endStation)
    {
        validator([
            'start_station' => $startStation,
            'end_station' => $endStation,
        ], [
            'start_station' => 'required|exists:station,id',
            'end_station' => 'required|exists:station,id',
        ])->validate();

        $trips = Trip::getAllValidTrips($startStation, $endStation);
        $validTrips = [];
        foreach ($trips as $trip) {

            $validTrip = [
                'trip_id' => $trip->id,
                'bus_id' => $trip->bus->name,
                'start_station' => $trip->startStation->name,
                'end_station' => $trip->endStation->name,
                'start_time' => $trip->start_time,
                'end_time' => $trip->end_time,
                "start_station_order" => $trip->getStopOrder($startStation),
                "end_station_order" => $trip->getStopOrder($endStation),
            ];

            $validSeats = [];
            $startStationOrder = $trip->getStopOrder($startStation);
            $endStationOrder = $trip->getStopOrder($endStation);
            $seats = $trip->getTripSeats();

            foreach ($seats as $seat) {

                if ($this->checkSeatAvailability($seat, $startStationOrder, $endStationOrder, $trip)) {
                    continue;
                }

                $validSeats[] = [
                    'id' => $seat->id,
                    'seat_number' => $seat->seat_number,
                ];
            }

            $validTrip['seats'] = $validSeats;
            $validTrips[] = $validTrip;
        }

        return response()->json($validTrips, 200);
    }

    public function book()
    {
        $user = auth()->user();
        $data = request()->validate([
            'trip_id' => 'required|exists:trip,id',
            'seat_id' => ['required',
                'numeric',
                'exists:bus_seat,id',
                Rule::in(Trip::find(request()->trip_id)->bus->seats->pluck('id')->toArray()),
            ],
            'start_station_id' => ['required',
                'numeric',
                'exists:station,id',
                Rule::in(Trip::find(request()->trip_id)->tripStops->pluck('station_id')->toArray()),
            ],
            'end_station_id' => ['required',
                'numeric',
                'exists:station,id',
                Rule::in(Trip::find(request()->trip_id)->tripStops->pluck('station_id')->toArray()),
            ],
        ]);

        $trip = Trip::find($data['trip_id']);
        $startStationOrder = $trip->getStopOrder($data["start_station_id"]);
        $endStationOrder = $trip->getStopOrder($data["end_station_id"]);
        if ($startStationOrder > $endStationOrder) {
            return response()->json([
                'message' => 'Start station must be before end station',
            ], 400);
        }

        $bus = $trip->bus;
        $seat = BusSeat::find($data['seat_id']);

        if ($this->checkSeatAvailability($seat, $startStationOrder, $endStationOrder, $trip)) {
            return response()->json([
                'message' => 'Seat is already reserved',
            ], 400);
        }

        $reservation = $user->reservations()->create([
            'bus_id' => $bus->id,
            'trip_id' => $trip->id,
            'bus_seat_id' => $seat->id,
            'start_station_id' => $data['start_station_id'],
            'end_station_id' => $data['end_station_id'],
        ]);

        return response()->json([
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 200);
    }

    private function checkSeatAvailability($seat, $startStationOrder, $endStationOrder, $trip)
    {
        $reservations = $trip->getTripSeatReservations($seat->id);

        foreach ($reservations as $reservation) {

            $resStartStationOrder = $trip->getStopOrder($reservation->start_station_id);
            $resEndStationOrder = $trip->getStopOrder($reservation->end_station_id);
            if ($this->checkOverlap($startStationOrder, $endStationOrder, $resStartStationOrder, $resEndStationOrder)) {
                return true;
            }

        }
        return false;
    }

    private function checkOverlap($resStartStationOrder, $resEndStationOrder, $startStationOrder, $endStationOrder)
    {
        if ($startStationOrder < $resEndStationOrder && $endStationOrder > $resEndStationOrder) {
            return true;
        }
        if ($endStationOrder > $resStartStationOrder && $startStationOrder > $resEndStationOrder) {
            return true;
        }
        if ($startStationOrder == $resStartStationOrder && $endStationOrder == $resEndStationOrder) {
            return true;
        }
        return false;
    }

}
