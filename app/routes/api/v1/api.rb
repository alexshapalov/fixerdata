require 'net/http'
require 'app/fixer_api'

module FixerData
  module Routes
    class Api < Sinatra::Application
      helpers Sinatra::FixerApi

      namespace '/api/v1' do
        get '/' do 
          'Welcome to FixerData API! 😻'
        end

        get '/data/:date/:base' do
          date = params[:date]
          base_currency = params[:base]

          get_exchange_rate(date, base_currency)
        end
      end
    end
  end
end