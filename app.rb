require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$LOAD_PATH << File.expand_path('../', __FILE__)
$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'dotenv'
Dotenv.load

require 'sinatra/base'
require 'sinatra'
require "sinatra/namespace"
require "sinatra/json"
require 'redis-sinatra'
require 'app/routes'

module FixerData
  class App < Sinatra::Application
    register Sinatra::Initializers

    configure do
      set :root, File.dirname(__FILE__)

      if settings.development? || settings.test?
        set :base_url, 'http://localhost:3040'
      else
        set :base_url, ENV.fetch('BASE_URL')
      end

      disable :method_override

      enable :static
    end

    # Routes
    use Routes::Base
    use Routes::Api
  end
end
