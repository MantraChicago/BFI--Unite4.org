## BFI Unite4Good - unite4.org

*Note*: All development should take place against the release_candidate
branch. 

The `master` branch will always represent a stable release of what is on
production.

The `release_candidate` branch should always be stable, and buildable,
but will not necessarily reflect what is on production. 

You can deploy `release_candidate` to staging as long as it is stable.

### System Dependencies

The app depends on the following external services or libraries:
  - rvm with ruby 1.9.3-p392 ( requires XCode 4.6.2 with developer tools )
  - postgresql 9.2 ( should be installed via brew where possible )
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

### PostGIS

This section assumes you install postgres via brew.  If you didn't there's a very good chance this will not work.

You can install PostGIS via brew:

```
brew install postgis
```

Post Install Notes:
To create a spatially-enabled database, see the documentation:
http://postgis.refractions.net/documentation/manual-2.0/postgis_installation.html#create_new_db_extensions
and to upgrade your existing spatial databases, see here:
http://postgis.refractions.net/documentation/manual-2.0/postgis_installation.html#upgrading

PostGIS SQL scripts installed to:
  /usr/local/share/postgis
PostGIS plugin libraries installed to:
  /usr/local/opt/postgresql/lib
PostGIS extension modules installed to:
  /usr/local/opt/postgresql/share/postgresql/extension

The TLDR; version is open up a psql console and:

```
create extension postgis;
```

### PostGIS (Ubuntu 12.04 Install)


```
sudo apt-get install postgresql-contrib-9.2
```

Install GEOS (just use latest, I used 3.3.8)

```
wget http://download.osgeo.org/geos/geos-3.3.8.tar.bz2
tar -xvf geos-3.3.8.tar.bz2
cd geos-3.3.8/
./configure
make
sudo make install
```

Install PostGIS

```
wget http://download.osgeo.org/postgis/source/postgis-2.0.3.tar.gz
tar xfvz postgis-2.0.3.tar.gz
cd postgis-2.0.3

./configure
make
sudo make install
sudo ldconfig
sudo make comments-install
```

Again you have to run `create extension postgis` for each database.
