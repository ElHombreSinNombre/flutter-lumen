<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::insert([
            'name' => 'Admin',
            'email' => 'flutterlumen@test.com',
            'password' => bcrypt('test'),
            'language' => 'es',
            'city' => 'Bilbao',
            'latitude' => '43.26271',
            'longitude' => '-2.92528',
        ]);

        User::factory(9)->create();
    }
}
