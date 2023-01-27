<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Station extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $table = 'station';
    protected $fillable = [
        'name',
    ];

    public function trips()
    {
        return $this->belongsToMany(Trip::class, 'trip_stop', 'station_id', 'trip_id');
    }
}
