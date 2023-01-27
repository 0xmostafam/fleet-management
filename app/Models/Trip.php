<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Trip extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'trip';
    protected $fillable = [
        'bus_id',
        'start_station_id',
        'end_station_id',
        'start_time',
        'end_time',
    ];

    public function bus()
    {
        return $this->belongsTo(Bus::class);
    }

    public function stations()
    {
        return $this->hasMany(Station::class);
    }

    public function tripStops()
    {
        return $this->hasMany(TripStop::class);
    }

    public function startStation()
    {
        return $this->belongsTo(Station::class, 'start_station_id');
    }

    public function endStation()
    {
        return $this->belongsTo(Station::class, 'end_station_id');
    }

    public function getStopOrder($stationId)
    {
        return $this->tripStops->where('station_id', $stationId)->first()->order;
    }

    public function getTripSeats()
    {
        return $this->bus->seats;
    }

    public function getTripSeatReservations($seatId)
    {
        return $this->getTripSeats()->where('id', $seatId)->first()->reservations;
    }

    public static function getAllValidTrips($startStation, $endStation)
    {

        $validTrips = Trip::whereHas('tripStops', function($query) use ($startStation){
            $query->where('station_id', $startStation);
        })->whereHas('tripStops', function($query) use ($endStation){
            $query->where('station_id', $endStation);
        })->get();

        $validTrips = $validTrips->filter(function($trip) use ($startStation, $endStation){
            $startStationOrder = $trip->tripStops->where('station_id', $startStation)->first()->order;
            $endStationOrder = $trip->tripStops->where('station_id', $endStation)->first()->order;
            return $startStationOrder < $endStationOrder;
        });

        return $validTrips;
    }
}
