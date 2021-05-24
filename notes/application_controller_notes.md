require './config/environment'

class ApplicationController < Sinatra::Base
# top level contoller that is inheriting from sinatra base
  # rest of controllers can inherit from this controller & don't have to require any dependencies
# ruby class inheriting base method from sinatra library, allows us to make requests & define routes
# methods availiable through sinatra base: get, post, patch, delete using blocks, ability to greate routes using those verbs
  # get - finds and diplays data, show me this
  # post - sends data, used for forms (ex. login with submit button), submitting something
  
  configure do
    # telling to use views
    # set sessions
      # makes app aware going to be using sessions & provide security
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    # "secret" should not be publically availiable to anyone looking at repository
    # Okay for this project bc not building a system that is going to gather sensitive info from user
    register Sinatra::Flash
    # by using Flash, I get Flash=>{} hash created
      # whenever I show a flash message, populate flash has with key/value pair
  end

  get "/" do
    # get = http verb
    # root route, www.google.com
    erb :home
  end

  helpers do
  # behaves the same as helpers class
  # makes methods availiable to controllers and views
    # return the logged in user
    # define what a current user is in relation to user id
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) # memoization
      # going to check instance variable, if already returning value it wont hit db
      # if doesn't have value, query db and set the instance variable = whatever is found
      # beneficial = hit as few times as can, hitting db slows app
    end

     # verifty if a user islogged in
    def logged_in?
      # session[:user_id], two !! infront
      !!current_user
      # check if there is value in session hash returning currently logged in user
    end

    # require a user to be logged in to have access to certain views
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:not_logged_in] = "You need to be logged in first, in order to view what you would like to see."
        redirect "/login"
      end
    end

  end
end