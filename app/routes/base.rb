module FixerData
  module Routes
    class Base < Sinatra::Application
      get '/' do
        'Welcome to FixerData! 😻'
      end    
    end
  end
end
