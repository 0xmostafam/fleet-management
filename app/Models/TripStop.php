<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TripStop extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'trip_stop';

    protected $fillable = [
        'trip_id',
        'station_id',
        'order',
    ];

    public function trip()
    {
        return $this->belongsTo(Trip::class);
    }

    public function station()
    {
        return $this->belongsTo(Station::class);
    }
}
