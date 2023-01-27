<?php

namespace Database\Seeders;

use App\Models\Station;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $stationNames = ['Cairo', 'Al Minyah', 'Alexandria', 'Aswan', 'Asyut', 'Banha', 'Beni Suef', 'Damanhour', 'Damietta', 'El Arish', 'El Giza'];
        foreach ($stationNames as $stationName) {
            Station::create([
                'name' => $stationName,
            ]);
        }
    }
}
