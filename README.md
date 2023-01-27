# Fleet Management

This is a simple fleet management system. It is a web application that allows you to manage your fleet of bus. It allows you to add, edit, delete and view trip and trips stops. It also allows users to book a seat in a trip, view their bookings, and see the list of seats and trips that can be booked given to trip stop.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
Composer
mysql
php8
```

### Installing

A step by step series of examples that tell you how to get a development env running

```bash
git clone https://github.com/0xmostafam/fleet-management
cd fleet-management
composer install
```

### Running the project

1. run the migration

```bash
php artisan migrate
```

2. run the seeders

```bash
php artisan db:seed
```
the seeder will generate the following:

-  2 users with 2 roles  
    - admin  
        - email: admin@admin.com  
        - password: admin  
        - role : admin  
    - user  
        - email: user@user.com  
        - password: user  
        - role: user  

- 5 buses each with 12 seats
- 11 Station
- 5 trips each with 11 stations

Note: you can skip 1 and 2 if you import the SQL dump file `fleet_management_system.sql` in the root directory of the project  

3. run the project

```bash
php artisan serve
```

4. run the test
```
php artisan test
```

### Database Schema

![Database Schema](https://i.imgur.com/nUI7I18.png)


### Api Documentation

the postman api documentation is available in the root directory of the project in the file `Fleet Management System.postman_collection.json` and this is the list of the available endpoints : 

```
<!-- Users Auth -->
POST api/login
POST api/register
POST api/logout

<!-- Admin Auth -->
POST api/admin/register (admin only)

<!-- Reservation -->
GET api/reservations (To get user reservations)
POST api/reservations/book (To book a seat)
GET api/reservations/start/{start_station}/end/{end_station} (To get all avaliable reservations between two stations)

<!-- Stations -->
GET api/stations
POST api/stations (admin only)
GET api/stations/{id}
PUT api/stations/{id} (admin only)
DELETE api/stations/{id} (admin only)

<!-- Buses -->
POST api/buses (admin only)
PUT api/buses/{id} (admin only)
DELETE api/buses/{id} (admin only)

<!-- Trips -->
GET api/trips 
POST api/trips (admin only) 
GET api/trips/{id}
PUT api/trips/{id} (admin only)
DELETE api/trips/{id} (admin only)
```