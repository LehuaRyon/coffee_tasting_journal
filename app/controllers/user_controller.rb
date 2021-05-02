class UserController < ApplicationController
# inherit anything thats defined in Application Controller
# responsible for aything involves author

    # sign up /signup new => creating user object
    # render the signup form
    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        
    end

    # login /login read => find user and read attributes 

    #logout /logout delete => clears session
end