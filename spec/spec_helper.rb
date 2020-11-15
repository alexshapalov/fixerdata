require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
ENV['SHARE_MEOW_SECRET_KEY'] = 'very_secret'

require File.expand_path('../../app', __FILE__)

require 'rspec'
require 'rack/test'
require 'pry-byebug'
require 'app/routes'
require 'vcr'

def app
  described_class
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = false
  config.ignore_localhost = true
  # config.filter_sensitive_data('<ACCESS_TOKEN>')  { ENV['ACCESS_TOKEN'] }
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
