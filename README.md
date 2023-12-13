# Project: Rails depot Scaffold

I build web-based Depot (shop) application using Rails from book
`Agile Web Development with Rails 7 by Sam Ruby`.
I build it for learning purposes #ruby #rails #rails7 #samruby

App is available here [Depot App (deployment by Digital Ocean)](http://138.68.128.38/products)


## What I learned

* Ruby version problems
* System dependencies and configuration
* Database creation and initialization
* How to run the test suite in rails
* Unit testing of models
* Test Fixtures: fixture is an environment in which you can run a test. A test fixture is a specification of the initial contents of a model (or models) under test.
* Services (job queues, cache servers, search engines, etc.)
* Deployment on Digital ocean 


## Technical details for the App

* I created a dev database.
* I used a migration to create and modify the schema in our development database.
* I created the products table and used the scaffold generator to write an application to maintain it.
* I updated a controller-specific view to show a list of products.


## How to run an app

Below steps are necessary to get the app up and running locally:

* clone the repo
* install all dependencies
* install Rails 7.0.8 `rails new depot --css tailwind`
* install ruby 3.1.2 `brew install ruby`
* install a database SQLite 3 
* run in console rails s
* open `http://localhost:3000/products`


## Cloud deployment - Docker

For deployment, we’re going to make use of two Docker containers.
The web server container will be running a combination of nginx1 and Phusion Passenger.

* Configuring the database 
* Keeping secrets
* Building a docker image 
* Deploying the application


## Rails

* Database initialization
```
bin/rails db:seed
```

* This will put you directly into the SQLite database that the app uses
```
bin/rails dbconsole
``` 

* Rolling back the migration
```
bin/rails db:rollback
bin/rails db:migrate
```

* Run unit tests of models
```
bin/rails test:models
```

* Run unit tests 
```
bin/rails test
# run one test case
bin/rails test test/controllers/products_controller_test.rb:19
```

* Each test method gets a freshly initialized table in the test database, loaded from the fixtures we provide
```
bin/rails db:test:prepare
```




## Todo

* fix tailwind issues