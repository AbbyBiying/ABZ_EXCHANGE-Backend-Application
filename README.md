# ABZ EXCHANGE back end application

## This is a Ruby on Rails app for barter trading.
You can demo this application on [Heroku](http://www.abzexchange.com/) 

If you have items or services to exchange we can help you connect with interested people!

When you sign up and get a welcome email, you can:

* See successful exchanges
* Add your own listing
* Make an offer on a listing
* Accept an offer
* Complete an exchange
* Add images
* Add groups
* Follow other users
* Add comments to listings, images and groups
* Find direction to reach another user
* Search listings, offers, users, images and comments.

## Implementation
Rendering is done on the server side with erb.
Google Map API is used for showing users' locations on maps.
Debugging tool is pry-rails

## Running locally

First, git clone the repo:
```sh
git clone git@github.com:AbbyBiying/ABZ_EXCHANGE.git
```

### Installing Ruby
[How to install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
 

#### On OS X machines, you can use [Ruby Version Manager (RVM)](https://rvm.io/rvm/install)

Install RVM
```sh
\curl -sSL https://get.rvm.io | bash -s stable
```

Install Ruby 2.4
```sh
rvm install 2.4
```

Activate Ruby 2.4
```sh
rvm use 2.4
```

###  Installing Bundler gem and bundle install dependencies

```sh
gem install bundler
bundle install
```
#### Start the server
```sh
bundle exec puma
```
visit http://localhost:9292/

## Running Tests
##### Rspec is used for unit tests. I do both Classical and Mockist testing styles.

##### Rspec with Capybara as well as Cucumber are used for integration/feature tests with WebMock, a Library for stubbing and setting expectations on HTTP requests in Ruby. 

##### FactoryBot is used to set up database records for testing in order to keep my test code clean and isolate the causes and effects in each specific test.


##### Run the test suite with RSpec:
```sh
bundle exec rspec -fd
```
