class CoffeeController < ApplicationController
# inherit anything thats defined in Application Controller
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
        get_coffee
        # render the correct erb
        erb :'coffees/show'
    end

    # user requested to view form to add a new coffee 'coffees/new' => had to move above becuase of dynamic routes, file in read in order

    # user submitted new coffee form, and redirected to see coffee just created
    post '/coffees' do
        # adding new coffee to collection of coffees
        # create new coffee
        # redirect user
        # @coffee = Coffee.new(name: params[:name], roaster: params[:roaster], etc.)
        # @coffee = Coffee.new(params)
        # hasnt been persisted, so no id, need to be persisted
        # @coffee.save
        @coffee = Coffee.new(params)
        # changed from .create to .new
            # now user logged in, set @posts key that associates post with logged in user 
            # set it = to user logged in
            # only way to persist that value is by doing .save
                # .create wouldn't persist modifications to database
        # create and persist at the same time, now has id bc its saved in db
        # how to associate coffee with current;y logged in user
        @coffee.user_id = session[:user_id]
        # another way: user = User.find(session[:user_id]), user.coffees << @coffee
        # another way: user.coffees.build(params)
            # associate new coffee with user and create it at same time
            # activerecord method
        # persist object to database
        @coffee.save
        redirect "/coffees/#{@coffee.id}"
        # redirect user to coffee's show page using that new coffee's id in place of the show route's placeholder
    end
    
    get '/coffees/:id/edit' do
        # retrieve object with givne id
        # autofill a form with the previous info of object
        # render to user can then make changes 
        # get_coffee
        get_coffee
         # using find_by with activerecord to retrieve object from database
        if @coffee.user == current_user
            erb :"/coffees/edit"
            # render edit form
        else
            flash[:not_owner] = "You are not the owner"
            redirect '/coffees'
        end
    end

    # user submitted edit form
    patch '/coffees/:id' do
        # no view, recieveing data from user not showing data
        # update the object with new attributes
        get_coffee
        if @coffee.user == current_user
            # if user is authorized, go ahead and make update
            @coffee.update(name: params[:name], roaster: params[:roaster], producer: params[:producer], variety: params[:variety], process: params[:process], notes: params[:notes])
            # have to parse through params bc parms by itself gives me _method key with patch value
            redirect "/coffees/#{@coffee.id}"
        else
            flash[:not_owner] = "You cannot make this edit. You are not the owner."
            redirect '/coffees'
        end
        # redirect to show page to see updated object
        # dont need .save bc with .update it persists to db already

        #erb :"/coffees/edit"
    end

    # user deletes exiting coffee
    delete '/coffees/:id' do
        # no view
        get_coffee
        @coffee.destroy
        # activerecord method deletes entire object
        redirect '/coffees'
        # redirect to index page/main page

        # add if @coffee.user == current_user
    end

private

    def get_coffee
        @coffee = Coffee.find_by(id:params[:id])
    end

    def redirect_if_not_authorized
        
    end
end



