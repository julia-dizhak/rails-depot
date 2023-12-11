# Rails depot Scaffold

This doc contain steps are necessary to get the
app up and running.

## App

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions


## How to run an app

Below steps are necessary to get the app up and running locally:

* install all dependencies
* run in console rails s
* open `http://localhost:3000/products`

## Rails

* Database initialization
```
bin/rails db:seed
```

* This will put you directly into the SQLite database that the app uses
```
bin/rails dbconsole.
``` 

* Rolling back the migration
```
bin/rails db:rollback
bin/rails db:migrate
```


