class CoffeeController < ApplicationController
# inherit anything thats defined in Application Controller

    # user requested all coffees
    get '/posts' do
        @coffees = Coffee.all
        # return all coffees I created 
        # using active record mehthod to reach into table, controller communicating with model, store those values in instance variable
        # instance variable is accessible in view page rendered
        erb :'coffees/index'
    end
end