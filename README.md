### BFI


###Setup
The app requires a postgesql database connection. 

To populate the initial database schema run
>`$ rake db:schema:load`

The app requires Imagemagick to be installed. 

###Commands

To populate development data run

> `$ rake populateDevData`

To create an Active Admin user

> `$ rake createActiveAdminUser $email $password`

###Testing

The app uses rspec to run its tests. 

To create and populate the testing environment run
>`$ test_db_setup`

To run the tests run
>`$ bundle exec rspec`
