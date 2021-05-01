class CoffeeController < ApplicationController
# inherit anything thats defined in Application Controller

#==================== SHOW ==============================
    # user requested all coffees
    # index page
    get '/coffees' do
        @coffees = Coffee.all
        # return all coffees I created 
        # make call to database and gather all
        # using active record mehthod to reach into table, controller communicating with model, store those values in instance variable
        # instance variable is accessible in view page rendered
        # render view page
        erb :'coffees/index'
    end

    # user requested to view form to add a new coffee
    get '/coffees/new' do

        erb :'coffees/new'
    end

    # user requested details of 1 coffee
    # show page
    get '/coffees/:id' do
        # retieve requested post w/params
        # show details of that post
        # key is :id, value is whatever request made
        # params = {"id"=>"1"}
        # params[:id] => 1
        # dynamically return info on different coffees given id
        @coffee = Coffee.find(params[:id])
        # render the correct erb
        erb :'coffees/show'
    end

    # user requested to view form to add a new coffee 'coffees/new' => had to move above becuase of dynamic routes, file in read in order

    # user submitted new coffee form
    post '/coffees' do
        # adding new coffee to collection of coffees
        # create new coffee
        # redirect user
    end
    
    get '/coffees/:id/edit' do
        # retrieve object with givne id
        # autofill a form with the previous info of object
        # render to user can then make changes 
    end

    # user submitted edit form
    patch '/coffees/:id' do
        # no view, recieveing data from user not showing data
        # update the object with new attributes
    end

    # user deletes exiting coffee
    delete '/coffees/:id' do
        # no view

    end
end

#--------------------------------------------------------


