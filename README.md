# BFI


###Setup
The app requires a postgesql database connection. 

The app requires Imagemagick to be installed. 

The factory_girl gems might need to be not loaded when populating the initial schema

To populate the initial database schema run
> `$ rake db:schema:load`



###Commands

To populate development data run

> `$ rake populate_dev_data`

To create an Active Admin user

> `$ rake create_active_admin_user[$email,$password]`

###Testing

The app uses rspec to run its tests. 

To create and populate the testing environment run
> `$ rake test_db_setup`

To run the tests run
> `$ bundle exec rspec`
