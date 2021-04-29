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
  end

  # app controller
    # define general routes
    # any route that does not involve a model
    # ex. root route, contact route, about route
  # order of routes really matters

  get "/" do
    # get = http verb
    # root route, www.google.com
    erb :welcome
  end

end
