require 'sinatra/base'

module Sinatra
  module ApiAuthorization  
    API_URL = "http://data.fixer.io/api/".freeze 

    def authorized(date, base)
      uri = URI("#{API_URL}#{date}")

      params = { 
        access_key: ENV['ACCESS_TOKEN'],
        base: base,
        symbols: "USD"
      }

      responce(uri, params)
    end

    def responce(uri, params)
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      res.body if res.is_a?(Net::HTTPSuccess)
    end
  end

  helpers ApiAuthorization
end
