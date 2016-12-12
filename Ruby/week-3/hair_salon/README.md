# _Hair Salon_

#### By _**Kenneth Black**, 12/9/2016_

## Description

Hair Salon Page in Sinatra, allows users to add stylists and add multiple clients to them

**User Stories**

* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

## Setup/Installation Requirements

* Clone this repo: `git clone git@github.com:lawlietblack/salon.git`
* Change to the repo directory: `cd salon` 
* Install gems: `bundle install --path vendor/bundle`
* Run the app: `ruby app.rb`

## Database Setup Instructions

* install postgres and start psql
* `CREATE DATABASE hair_salon;`
* `CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);`
* `CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);`
* `CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;`

## Technologies Used

_JavaScript, Ruby, Sinatra, SQL, Postgres_

### License

*MIT License*

Copyright (c) 2016 **_Kenneth Black_**