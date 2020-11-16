# FixerData app 

The FixerData API is capable of delivering real-time exchange rate data for main world currencies. (EUR-USD)

## Development Requirements

  * Ruby 2.7.0+
  * Bundler

## Installation

```
rvm install 2.7.0
rvm use 2.7.0
bundle install
```

Start the server:

`$ rackup config.ru -p 3088`

Or you can use Docker.

## Configuration

 Before start, you should have an API key to an API on Fixer IO. 
 Read more and create on [Fixer API](https://fixer.io/documentation)
 
Create **.env** file in root derectory and add your credantails:

ACCESS_TOKEN = 'access_token'


## The API

#### GET `/api/v1/data/:date/:base`

This find and returns rate.

For example:

`/api/v1/data/2020-11-07/EUR`

Return:


``` 
{
  "success": true,
  "timestamp": 1604793599,
  "historical": true,
  "base": "EUR",
  "date": "2020-11-07",
  "rates": {
    "USD": 1.187435
  }
}
```



## How to run the test suite

Before running a test, please make sure you have a fresh version of the code:

```shell
git pull
bundle exec rspec spec/path/to/file_spec.rb
```

To run all the tests, please use:

```shell
bundle exec rspec spec
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Copyright

Copyright © 2020 Recipe FixerData