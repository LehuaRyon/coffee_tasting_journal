class UserController < ApplicationController

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        user = User.new(params)
        if user.username.blank? || user.email.blank? || user.password.blank? || user.first_name.blank? || user.last_name.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            flash[:signup_error] = "Invalid sign up, try again. Please fill out all the fields."
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id
            redirect '/coffees'
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/coffees'
        else
            flash[:login_error] = "Invalid login, try again. Please fill out both fields."
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end

end