# Project: Rails depot Scaffold

I build web-based Depot (shop) application using Rails from book
`Agile Web Development with Rails 7 by Sam Ruby`.
It is developed for learning purposes #ruby #rails #rails7 #samruby

App is available here [Depot App (deployment by Digital Ocean)](http://138.68.128.38/products)


## What I learned

* resolve a problem with the Ruby version
* System dependencies/configuration
* Database creation/initialization
* How to run the test suite in rails
* Unit testing vs. unit testing of models
* Write functional tests for the controller
* Test Fixtures: A fixture is an environment in which you can run a test. A test fixture is a specification of the initial contents of a model (or models) under test.
* Services (job queues, cache servers, search engines, etc.)
* Deployment by Digital Ocean 


## Technical details for the App:

* The app runs with a dev db;
* created the products table and used the scaffold generator to write an app to maintain it;
* used a migration to create/modify the schema;
* created a controller-specific view to show a list of products;
* added unit tests of model to be ensured that required fields are present in the model;
* create a store controller to handle customer-centric interactions.
* Add a call to the order() method within the Store controller to control the order in which the items on the website are listed.
* Implement a view and a layout to contain it.
* Use a helper to format prices the way we want.
* Implement fragment caching for portions of the page
* Created a Cart object in one request and successfully located the same cart in subsequent requests by using a session object.
* I added a private method and placed it in a concern, making it accessible to all of our controllers.
* created relationships between carts and line items, and relationships between line items and products, and we were able to navigate using these relationships.



## How to run an app

Below steps are necessary to get the app up and running locally:

* clone the repo
* install all dependencies: tailwind, etc
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

* Scaffold generators
```
bin/rails generate scaffold Cart
bin/rails generate scaffold LineItem product:references cart:belongs_to
```


* Testing
```
# Run unit tests of models
bin/rails test:models

# Run unit tests
bin/rails test

# run one test case
bin/rails test test/controllers/products_controller_test.rb:19
bin/rails test test/controllers/line_items_controller_test.rb

# test controllers
bin/rails test:controllers

# Each test method gets a freshly initialized table in the test database, loaded from the fixtures we provide
bin/rails db:test:prepare
```

* Caching
```
# on/off caching of partial results
bin/rails dev:cache 
Development mode is no longer being cached.
```


## Todo

* configure suggested workflows for rails
* fix a height 100% for store
* Shopping Basket to fix layout with buttons
* Shopping basket: fix ability to add duplicates
