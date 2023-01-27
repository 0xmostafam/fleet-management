<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BusSeat extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'bus_seat';
    protected $fillable = [
        'bus_id',
        'seat_number'
    ];

    public function bus()
    {
        return $this->belongsTo(Bus::class);
    }

    public function reservations()
    {
        return $this->hasMany(Reservation::class);
    }
}
