require 'spec_helper'
require 'sinatra/base'

RSpec.describe FixerData::App do
  describe 'GET root' do
    it 'loads root route' do
      get '/api/v1/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq 'Welcome to FixerData API! 😻'
    end
  end

  describe 'GET #data', :vcr do
    it 'should return date for EUR' do
      default_options = { 
        access_key: ENV['ACCESS_TOKEN']
      }

      get '/api/v1/data/2020-10-10/EUR'

      expect(last_response.body).to be_eql("{\"success\":true,\"timestamp\":1602374399,\"historical\":true,\"base\":\"EUR\",\"date\":\"2020-10-10\",\"rates\":{\"USD\":1.183085}}")
    end
  end

  describe "invalid api responce", :vcr do
    it 'bad credantials' do
      get '/api/v1/data/2020-10-10/:base'

      params = { 
        access_key: "jndcjnwjnjsahfiuwduihsdfh",
        base: "EUR",
        symbols: "USD"
      }
      expect(last_response.body).to be_eql "{\"success\":false,\"error\":{\"code\":201,\"type\":\"invalid_base_currency\"}}"
    end
  end
end
