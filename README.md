## BFI Unite4Good - unite4.org

*Note*: All development should take place against the release_candidate
branch. 

### Process / Server Dependencies

The app depends on the following external services or libraries:
  - rvm with ruby 1.9.3-p392
  - postgresql 9.2
  - ImageMagick ( for image upload processing )

Please consult documentation for your platform for getting these
installed.

### Getting Started

```bash
git clone git@github.com:MantraChicago/BFI--Unite4.org.git unite4
cd unite4
git checkout release_candidate
cp config/database.yml.example config/database.yml
bundle install
```

At this point you will want to edit the `config/database.yml` file to
include the database / authentication parameters local to your system.

### Setting up Development Data

```
bundle exec rake db:schema:load db:migrate db:seed db:populate_dev_data
bundle exec rake db:test:prepare
```

### Running The Test Suite

We currently use guard for automated test running. 

```
bundle exec guard start
```

If you want to run the test suite manually, you should before committing
to release_candidate:

```
bundle exec rspec spec/
```

The `master` branch will always represent a stable release of what is on
production.

The `release_candidate` branch should always be stable, and buildable,
but will not necessarily reflect what is on production. 

You can deploy `release_candidate` to staging as long as it is stable.

### System Dependencies

The app depends on the following external services or libraries:
  - rvm with ruby 1.9.3-p392 ( requires XCode 4.6.2 with developer tools )
  - postgresql 9.2
  - ImageMagick ( for image upload processing )

Please consult documentation for your platform for getting these
installed.  On MacOS you will generally want to use `homebrew`, on 
linux use `apt-get` 

### Getting Started

```bash
git clone git@github.com:MantraChicago/BFI--Unite4.org.git unite4
cd unite4
git checkout release_candidate
cp config/database.yml.example config/database.yml
bundle install
```

At this point you will want to edit the `config/database.yml` file to
include the database / authentication parameters local to your system.

### Setting up Development Data


```
bundle exec rake db:create:all db:schema:load db:seed
bundle exec rake db:test:prepare
```

If you have your SSH key on our deploy box, you can take a snapshot:

```
bundle exec rake snapshot:all
```

This will pull down not only the development data, but all of the
relevant uploaded files as well

### Running the Development Server

Once your development data is loaded, you should be able to develop
against the server running locally on localhost:3000

```
bundle exec rails server
```

### Running The Test Suite

We currently use guard for automated test running. You should have this
process running the entire time you are developing, to catch any
failures as you create them.

```
bundle exec guard start
```

If you want to run the test suite manually, which you should before committing
to release_candidate:

```
bundle exec rspec spec/
```

