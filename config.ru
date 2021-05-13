# how we enter application, instead of environment.rb like before
# where you mount controllers
  # have to mount every controller than is defined

# notify rack, here are all coponents of app and load anything in these paths, controllers

# require_relative './config/environment'
require './config/environment'
# changed to require because I was not able to load tux with require relative.

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

# Allows the method to be overridden if params[:_method] is set. This is the middleware which supports the PUT and DELETE HTTP method types.
use Rack::MethodOverride # middleware
use UserController
use CoffeeController
run ApplicationController
# this controller exists too and app will be using it
# create a controller for every model we have existing
