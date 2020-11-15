require 'net/http'
# require 'pp'
# require 'pry'
require 'app/fixer_api'
# require 'redis-sinatra'

module FixerData
  module Routes
    class Api < Sinatra::Application
      helpers Sinatra::FixerApi
      # register Sinatra::Cache

      namespace '/api/v1' do
        get '/data/:date/:base' do
          date = params[:date]
          base_currency = params[:base]

          # settings.cache.fetch('date')
          get_exchange_rate(date, base_currency)
        end

        get '/' do 
          'Welcome to FixerData API! 😻'
        end
      end
    end
  end
end