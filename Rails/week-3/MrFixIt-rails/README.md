# Mr. Fix-It

## About Us

_Mr. Fix-It is the one-stop-shop to crowd-source all your home repair needs. Need a fence repaired? Cabinets installed? Leaky pipe mended? Post the job on Mr.Fix-It. Then, independent handypeople, carpenters, plumbers, and more are able to view and claim jobs. It's like ride-sharing, but for home repairs!_

## Installation & Setup

- Fork this repository to your own GitHub account
- Clone your forked repo to your local machine
- Navigate to its directory in your terminal
- `$ postgres` to start a server
- `$ rake db:create` to load the database schema
- `$ rake db:migrate` to load each database migration
- `$ rake db:seed` to seed database with test user and worker accounts
- `$ rails s` to start the rails server
- Navigate to `localhost:3000` in your browser

## Development Roadmap

### Completed

_The following functionality is present in our application:_

* Users can register for basic user accounts. These accounts allow them to post jobs.
* Basic users can log into their accounts.
* Basic users may post their jobs to the jobs list.
* Basic users have the option to sign up for a Worker account, which allows them to claim and complete jobs.
* A worker can claim a job, and see it in their "Worker Dashboard"
* Workers must be able to claim a job **via an AJAX action**.
* A worker must be able to mark which jobs they're actively working on **using AJAX**.
* Workers must be able to mark jobs "complete" **using AJAX**.
* Site needs to look more presentable and polished.
* Unit and integration testing needs to be implemented throughout.

## License

The MIT License (MIT)

Copyright (c) 2017 Mr. Fix-It

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
