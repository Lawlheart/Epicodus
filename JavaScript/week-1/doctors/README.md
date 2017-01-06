# _Doctor Search_

####  _By [Kenneth Black](http://lawlietblack.com), 1/6/2017_

## Description

Allows users to search for doctors. Uses the [BetterDoctors API](https://developer.betterdoctor.com/) 

**User Stories**

* As a user, I want to be able to  enter a medical issue (ie: “toothache”) into a form, submit it, and receive a list of doctors I may seek out to help with my medical issue.

## Setup/Installation Requirements

* Clone this repo: `git clone git@github.com:lawlietblack/{repo}.git`
* Change to the repo directory: `cd {repo}`
* install dependencies: `npm install`
* install dependencies: `bower install`
* install gulp task runner: `npm install gulp -g`
* add ENV keys (instructions below)
* build files: `gulp build`
* run: `gulp serve`

## ENV setup

* copy sample.env to a new file named .env: `cp sample.env .env`
* Visit the BetterDoctors API site and click “Get a free API key”.
* Fill out the form, or authenticate with GitHub.
* Your API key should be listed on the front page (ex: “a2c356ibgh44…..”) or under My Account > Applications.
* replace placeholder in .env with your key (eg. exports.apiKey = 'a2c356ibgh44FAKE';

## Technologies Used

_Javascript, Node.js, Gulp, Sass, HTML_

## Known Issues

## License

*MIT License*

Copyright (c) 2016 **_Kenneth Black_**