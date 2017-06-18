# README

This app is a simple interface for creating tasks. Task creation is limited at 100 times per IP address/hour. Rate-limiting is provided by a module called RateLimiting. RateLimiting can be used on any controllers because it checks the combination of controller/action and IP address. If a request is within limit, response will be "ok". Otherwise response will be "Rate limit exceeded. Try again in #{n} seconds".

How to run the app:
1. Create a database called "airtasker_development" in your local postgres.
2. `bundle install`
2. `rails db:migrate RAILS_ENV=development`
3. `rails s`

How to run test:
1. rspec spec

* Currently the interface doesn't provide validation. All fields must be entered in order to have a record saved in database.
