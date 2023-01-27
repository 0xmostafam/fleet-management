<?php

namespace Database\Seeders;

use App\Models\Bus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 5; $i++) {
            $bus = Bus::create([
                'name' => 'Bus ' . $i + 1,
            ]);
            for ($j = 0; $j < 12; $j++) {
                $bus->seats()->create([
                    'seat_number' => $j + 1,
                ]);
            }
        }
    }
}
