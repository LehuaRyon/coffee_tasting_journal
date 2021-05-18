# how we enter application, instead of environment.rb like before
# where you mount controllers
  # have to mount every controller than is defined
# purpose of config.ru is to detail to Rack (Sinatra gem is built on top of Rack) the environment requirements of the application and start the application, mount my application controllers. 

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

__________________________________________________________________________________________________________

class Coffee < ActiveRecord::Base
# belongs to user and entry
    belongs_to :user
    # methods I get:
    # coffee.user / read the user that the coffee belongs to
    # coffee.user= / set the user that the coffee belongs to
    # coffee.build_user(hash of attributes)
    # coffee.create_user(hash of attributes)
    validates_presence_of :name, :roaster, :producer, :variety, :process, :notes
    # Validates that the specified attributes are not blank and, if the attribute is an association, that the associated object is not marked for destruction. Happens by default on save.
	validates_uniqueness_of :name
    # Validates whether the value of the specified attributes are unique across the system
    #  prevent bad data entry by users.
end

___________________________________________________________________________________________________________

class User < ActiveRecord::Base
    has_many :coffees
    # methods I get:
    # user.coffees
    # user.coffees << () shovel new coffee to user
    # user.coffees.build(hash of attributes)
    # user.coffees.create(hash of attributes)
    # enable model to be able to user autherntication
    has_secure_password
    # activerecord giv us this method
    # adds salt, to the user's password
    # salt = a randomized character string & user's password gets embedded in that string, hard to hack
    validates_presence_of :username, :email, :password, :first_name, :last_name
    validates_uniqueness_of :username, :email
    # validates_associated :coffees 
end