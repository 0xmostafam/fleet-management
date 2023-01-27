<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reservation extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'reservation';

    protected $fillable = [
        'user_id',
        'trip_id',
        'bus_id',
        'bus_seat_id',
        'start_station_id',
        'end_station_id',
    ];

    public function trip()
    {
        return $this->belongsTo(Trip::class);
    }

    public function busSeat()
    {
        return $this->belongsTo(BusSeat::class, 'bus_seat_id');
    }

    public function seatNumber()
    {
        return $this->busSeat->seat_number;
    }
}
