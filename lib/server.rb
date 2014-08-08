require 'sinatra/base'

class Foodly < Sinatra::Base
  get '/' do
    'Hello Foodly!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
