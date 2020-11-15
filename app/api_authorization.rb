require 'sinatra/base'

module Sinatra
  module ApiAuthorization
    BASE = "http://data.fixer.io/api/"
    SECRET_KEY = ENV.fetch('API_ACCESS_KEY'.freeze)
    # SECRET_URL = 'http://data.fixer.io/'.freeze
    key = "ab8cfd02257340f7492fa8f2bc66aed2"
    symbols = "USD"

    def authorized?
      "http://data.fixer.io/api/20-20-11?access_key=#{key}"
    end
  end

  # 'http://data.fixer.io/api/2020-11-10?access_key=ab8cfd02257340f7492fa8f2bc66aed2&symbols=USD&format=1'

  helpers ApiAuthorization
end
