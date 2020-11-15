require 'net/http'
# require 'pp'
# require 'pry'
require 'app/api_authorization'

module FixerData
  module Routes
    class Api < Sinatra::Application
      helpers Sinatra::ApiAuthorization

      namespace '/api/v1' do
        get '/data/:date/:base' do
          date = params[:date]
          base = params[:base]
          authorized(date, base)
        end

        get '/' do 
          'Welcome to FixerData API! 😻'
        end
      end
    end
  end
end