# how we enter application, instead of environment.rb like before
# where you mount controllers
  # have to mount every controller than is defined

# notify rack, here are all coponents of app and load anything in these paths, controllers

require_relative './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride # middleware
use UserController
use EntryController
use CoffeeController
run ApplicationController
# this controller exists too and app will be using it
# create a controller for every model we have existing
