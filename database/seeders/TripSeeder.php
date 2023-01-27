<?php

namespace Database\Seeders;

use App\Models\Bus;
use App\Models\Station;
use App\Models\Trip;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TripSeeder extends Seeder
{
    
    public function run()
    {
        $stations = Station::all();
        $buses = Bus::all();
        for ($i = 0; $i < 5; $i++) {
            $startStation = $stations->random();
            $bus = $buses->random();
            do {
                $endStation = $stations->random();
            } while($startStation->id == $endStation->id && $stations->count() > 1);
            
            $startTime = Carbon::now()->addDay(1);
            $endTime = Carbon::now()->addDay(1)->addHours(2);
            $busLatestEndTime = $bus->getLatestTripEndTime();
            if($busLatestEndTime){
                $startTime = Carbon::parse($busLatestEndTime)->addMinutes(30);
                $endTime = Carbon::parse($busLatestEndTime)->addHour(2)->addMinutes(30);
            }
            $trip = Trip::create([
                'start_station_id' => $startStation->id,
                'end_station_id' => $endStation->id,
                'bus_id' => $bus->id,
                'start_time' => $startTime,
                'end_time' => $endTime,
            ]);

            $stopStations = $stations->whereNotIn('id', [$startStation->id, $endStation->id]);

            $trip->tripStops()->create([
                'station_id' => $startStation->id,
                'order' => 1,
            ]);

            $order = 2;
            foreach($stopStations as $stopStation){
                $trip->tripStops()->create([
                    'station_id' => $stopStation->id,
                    'order' => $order,
                ]);

                $order++;
            }

            $trip->tripStops()->create([
                'station_id' => $endStation->id,
                'order' => $order,
            ]);
        }
    }
}
