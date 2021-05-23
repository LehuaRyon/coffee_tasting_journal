class CoffeeController < ApplicationController

    get '/coffees' do
        redirect_if_not_logged_in
        if current_user.coffees != []
            @coffees = current_user.coffees
        else
            @coffees = Coffee.all
        end
        erb :'coffees/index'
    end

    get '/coffees/new' do
        redirect_if_not_logged_in 
        erb :'coffees/new'
    end

    get '/coffees/:id' do
        redirect_if_not_logged_in 
        get_coffee
        erb :'coffees/show'
    end

    post '/coffees' do
        coffee = Coffee.new(params)
        coffee.user_id = current_user.id
        if coffee.save
            redirect "/coffees/#{coffee.id}"
        else
            flash[:coffee_attributes_not_all_filled_out] = "Please fill out every field.  Insert 'N/A' for the fields you do not have information for."
            redirect '/coffees/new'
        end
    end

    get '/coffees/:id/edit' do
        redirect_if_not_logged_in 
        get_coffee
        redirect_if_not_authorized
        erb :'/coffees/edit'
    end

    patch '/coffees/:id' do
        get_coffee
        redirect_if_not_authorized
        @coffee.update(name: params[:name], roaster: params[:roaster], producer: params[:producer], variety: params[:variety], process: params[:process], notes: params[:notes])
        redirect "/coffees/#{@coffee.id}"
    end

    delete '/coffees/:id' do
        get_coffee
        if @coffee.user.id == current_user.id
            @coffee.destroy
            redirect '/coffees'
        else
            flash[:not_owner_deletion] = "You cannot make this deletion. You are not the owner."
            redirect '/coffees'
        end
    end

private

    def get_coffee
        @coffee = Coffee.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @coffee.user.id != current_user.id
            flash[:not_owner_edit] = "You cannot make this edit. You are not the owner."
            redirect '/coffees'
        end 
    end
   
end
