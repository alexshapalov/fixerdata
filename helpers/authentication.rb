require 'multi_json'

module Sinatra
  module Authentication
    def authenticate!
      client_id = request['client_id']
      client_secret = request['client_secret']

      # Authenticate client here

      halt 401, MultiJson.dump({message: "You are not authorized to access this resource"}) unless authenticated?
    end

    def current_client
      @current_client
    end

    def authenticated?
      !current_client.nil?
    end
  end

  helpers Authentication
end