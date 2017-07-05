This is a simple application showing how to integrate Codeship and Elasticbeanstalk. There're two groups of instances: `webservers` process http requests, while `workers` process background jobs. Frontend is react and bootstrap.

https://richardchou.id.au/

![](http://i.imgur.com/TeORU6g.png)

# UPDATE
05/07/2017: `force_ssl` on production

26/06/2017: Integrated with CloudFront. Assets are now serving from CDN.

22/06/2017: Integrated with Codeship. So any commits to `master` will trigger tests. When tests pass, code will be packaged and pushed up to Elasticbeanstalk.

# README

This app is a simple interface for creating tasks. Task creation is limited at 100 times per IP address/hour (you can lower `REQUEST_LIMIT` to test response `429`). Rate-limiting is provided by a module called `RateLimiting`. `RateLimiting` can be used on any controllers because it checks the combination of controller/action and IP address. If a request is within limit, response will be "ok". Otherwise response will be "Rate limit exceeded. Try again in #{n} seconds".

![](http://i.imgur.com/Y2iXApD.png)
![](http://i.imgur.com/RVxZIHe.png)

How to run the app:
1. Create a database called "airtasker_development" in your local postgres.
2. `bundle install`
2. `rails db:migrate RAILS_ENV=development`
3. `rails s`
4. `http://localhost:3000`

How to run test:
1. rspec spec

* Currently the interface doesn't provide validation. All fields must be entered in order to have a record saved in database.
