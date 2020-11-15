require 'net/http'
require 'pp'
require 'pry'

module FixerData
  module Routes
    class Api < Sinatra::Application
      namespace '/api/v1' do
        # unless authorized?(encoded_params: params[:encoded_params], encoded_hmac_digest: params[:encoded_hmac_digest])
        #   halt 401, 'Not authorized'
        # end

        # key = "ab8cfd02257340f7492fa8f2bc66aed2"
        # symbols = "USD"
    
        # def authorized?
        #   "http://data.fixer.io/api/20-20-11?access_key=ab8cfd02257340f7492fa8f2bc66aed2"
        # end
        
        # http://data.fixer.io/api/latest?access_key=ab8cfd02257340f7492fa8f2bc66aed2&symbols=USD,AUD,CAD,PLN,MXN&format=1

        get '/data/:date/:base' do
          latest = params[:date]
          cur = params[:base]

          start_date = "2012-05-01"
          day = "2020-10-25"

          uri = URI("http://data.fixer.io/api/#{latest}")

          params = { 
            access_key: 'ab8cfd02257340f7492fa8f2bc66aed2',
            # start_date: "2018-02-25",
            # end_date: "2018-02-26",
            # base: "EUR",
            base: cur,
            symbols: "USD"
          }

          uri.query = URI.encode_www_form(params)

          res = Net::HTTP.get_response(uri)
          res.body if res.is_a?(Net::HTTPSuccess)

          # binding.pry

          # fees = JSON.parse(res.body)
        end

        get '/' do 
          'Welcome to FixerData API! 😻'
        end
      end
    end
  end
end