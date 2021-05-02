class UserController < ApplicationController
# inherit anything thats defined in Application Controller
# responsible for aything involves author

    # sign up /signup new => creating user object
    # render the signup form
    get '/signup' do
        erb :"users/signup"
    end

    # process signup form, ingest data
    post '/signup' do
        # recieve data from form inside params has
        # create new user object with data
        user = User.new(params)
        # validate user object
        if user.username.blank? || user.email.blank? || user.password.blank? || user.first_name.blank? || user.last_name.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:usersame])
            # using ||, or, to check if one of these fields is not empty, could still use and tho
            # is the username and email unique?
            # can use .empty?, .blank?, .nil?, != ""
            #if true do this is false then something else
        end
        # persist new object  so encrypts password

        # user is signing in with unique data
            # maybe user already signed up, looks like acct already existing
            # maybe tried same username as somebody else, username already taken
            # differentiate each object from one another
            # manage data more efficiently with validations
            # activerecord validation methods or use conditionals
                # conditionals check to make sure unique before moving on
                # if user is valid
                    # persist new object
                    # redirect to index
                # else
                    # redirect to signup page
                # notify username taken, already exsists - flash message
        
    end

    # login /login read => find user and read attributes 

    #logout /logout delete => clears session
end