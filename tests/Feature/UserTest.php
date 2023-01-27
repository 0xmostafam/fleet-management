<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UserTest extends TestCase
{

    // test user registration
    public function testUserRegistration()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);

        $response->assertStatus(201);

        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }

    public function testUserDuplicateRegistration()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);
        $response = $this->json('POST', 'api/register', $data);

        $response->assertStatus(422);
        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }

    public function testUserLogin()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);

        $response = $this->json('POST', 'api/login', [
            'email' => $data['email'],
            'password' => $data['password']
        ]);

        $response->assertStatus(201);

        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }

    public function testUserLoginWithWrongPassword()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);

        $response = $this->json('POST', 'api/login', [
            'email' => $data['email'],
            'password' => 'wrongpassword'
        ]);

        $response->assertStatus(401);

        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }

    public function testUserLoginWithWrongEmail()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);

        $response = $this->json('POST', 'api/login', [
            'email' => 'wrongemail@email.com',
            'password' => $data['password']
        ]);

        $response->assertStatus(401);

        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }

    public function testUserLogout()
    {
        $data = [
            'name' => 'John Doe',
            'email' => 'john@doe.com',
            'password' => 'password',
            'password_confirmation' => 'password'
        ];

        $response = $this->json('POST', 'api/register', $data);
        $token = $response->json('token');

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)->json('POST', 'api/logout');

        $response->assertStatus(200);

        $user = User::where('email', $data['email'])->first();
        $user->delete();
    }
}
