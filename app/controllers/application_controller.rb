require './config/environment'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

   configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, SecureRandom.hex(24)
   end
  end 