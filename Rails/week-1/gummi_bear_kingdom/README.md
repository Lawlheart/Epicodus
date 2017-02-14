# _Gummy Bear Kingdom_

#### By _**Kenneth Black**, 2/10/2017_

## Description

A commerce site for a kingdom of gummy bear people that sell other candy.

**User Stories**

* As a user, I can visit a products section with a list of all the tasty products offered by the Gummi Bear Kingdom company.
* As a user, I can visit a landing page where I can find basic information about Gummi Bear Kingdom, and allow users to easily navigate to other areas of the site.
* As a user, I can click on an individual product to find a page with more juicy details!
* As an admin of the Gummy Bear Kingdom, I can add new products to the site, so that all may taste the glory of our creations!

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

_Ruby, Rails, SQL, Postgres, JavaScript, Bootstrap, jQuery_

### Known Issues

* Images are never deleted from the file system, need handlers for that on delete and edit (if changing image)

### License

*MIT License*

Copyright (c) 2016 **_Kenneth Black_**