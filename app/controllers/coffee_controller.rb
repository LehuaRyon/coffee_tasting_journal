class CoffeeController < ApplicationController
# inherit anything thats defined in Application Controller

#==================== SHOW ==============================
    # user requested all coffees
    get '/coffees' do
        @coffees = Coffee.all
        # return all coffees I created 
        # using active record mehthod to reach into table, controller communicating with model, store those values in instance variable
        # instance variable is accessible in view page rendered
        erb :'coffees/index'
    end

    # user requested details of 1 post
    # show page
    get '/coffees/:id' do
        # retieve requested post w/params
        # show details of that post
        # key is :id, value is whatever request made
        # params = {"id"=>"1"}
        # params[:id] => 1
        # dynamically return info on different coffees given id
        @coffee = Coffee.find(params[:id])
    end
end

#--------------------------------------------------------