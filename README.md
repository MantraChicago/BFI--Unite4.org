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

