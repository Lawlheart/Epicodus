# _Shoe Distribution_

#### By _**Kenneth Black**, 12/16/2016_

## Description

A program to track shoe brands and what stores they are in.

**User Stories**

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands.
* As a user, I want to be able to add shoe brands in the application.
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Setup/Installation Requirements

* Clone this repo: `git clone git@github.com:lawlietblack/{repo}.git`
* Change to the repo directory: `cd {repo}`
* Install gems: `bundle install --path vendor/bundle`
* Install the database: *instruction below*
* Run the app: `ruby app.rb`

## Database Setup Instructions

* install and start postgres
* run: `bundle exec rake db:create`
* run: `bundle exec rake db:migrate`
* run: `bundle exec rake db:test:prepare`

## Technologies Used

_Ruby, Sinatra, SQL, Postgres, JavaScript, MaterializeCSS, jQuery_

### Known Issues

* Brands can be added to the same store twice
* Empty argument for /stores/:id/brands throws 500 error instead of failing silently
* Empty argument for /brands/:id/stores throws 500 error instead of failing silently

### License

*MIT License*

Copyright (c) 2016 **_Kenneth Black_**
