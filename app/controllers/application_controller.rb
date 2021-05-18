require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :home
  end

  helpers do
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:not_logged_in] = "You need to be logged in first, in order to view what you would like to see."
        redirect "/login"
      end
    end
  end

end
