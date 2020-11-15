require 'spec_helper'

RSpec.describe FixerData::App do
  describe '/' do
    it 'loads root route' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq 'Welcome to FixerData! 😻'
    end
  end
end
