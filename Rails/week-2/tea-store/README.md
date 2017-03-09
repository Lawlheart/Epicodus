# _Tea Store_

#### By _**Kenneth Black**, 2/17/2017_

## Description

A tea store.

**User Stories**

* As a user, I can visit a teas section with a list of all the teas that I can buy.
* As a user, I can visit a landing page where I can find basic information about the store, and allow users to easily navigate to other areas of the site.
* As a user, I can click on an individual product to find a page with more details.
* As an admin, I can add new products to the site.
* As an admin, I can edit and delete products on the site.


## Setup/Installation Requirements

* Clone this repo: `git clone git@github.com:lawlietblack/tea-store.git`
* Change to the repo directory: `cd tea-store`
* Install gems: `bundle install --path vendor/bundle`
* Install the database: *instruction below*
* Run the app: `ruby app.rb`

## Database Setup Instructions

* install and start postgres
* run: `bundle exec rake db:create`
* run: `bundle exec rake db:migrate`
* run: `bundle exec rake db:test:prepare`
* seed the database(optional): `bundle exec rake db:setup`

## Technologies Used

_Ruby, Rails, ActiveRecord, Devise, SQL, Postgres, JavaScript, jQuery_

### Known Issues


### License

*MIT License*

Copyright (c) 2017 **_Kenneth Black_**