require 'sinatra/base'
require_relative 'redis_cache.rb'

module Sinatra
  module FixerApi
    API_URL = "http://data.fixer.io/api/".freeze 

    def get_exchange_rate(date, base_currency)
      redis_key = date.to_s + base_currency
      
      result_from_redis = RedisCache.execute_cache(redis_key) do 
        uri = URI("#{API_URL}#{date}")
  
        params = { 
          access_key: ENV['ACCESS_TOKEN'],
          base: base_currency,
          symbols: "USD"
        }
  
        get_data_from_fixer(uri, params)
      end
    end

    def get_data_from_fixer(uri, params)
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      res.body if res.is_a?(Net::HTTPSuccess)
    end
  end

  helpers FixerApi
end
