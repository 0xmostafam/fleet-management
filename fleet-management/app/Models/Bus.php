<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bus extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'bus';
    protected $guarded = ['id'];
    protected $fillable = [
        'name',
        'capacity'
    ];

    public function seats()
    {
        return $this->hasMany(BusSeat::class);
    }

    public function trips()
    {
        return $this->hasMany(Trip::class);
    }

    public function getLatestTripEndTime()
    {
        $latestTrip = $this->trips()->orderBy('end_time', 'desc')->first();
        if ($latestTrip) {
            return $latestTrip->end_time;
        }
        return null;
    }
}
