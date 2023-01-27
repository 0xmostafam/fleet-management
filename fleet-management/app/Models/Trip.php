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
}
