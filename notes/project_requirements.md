- Create a CRUD, MVC app using Sinatra
- App should be a custom app that is created to track something important to you, 
    - Building a simple Content Management System (CMS)

Project Requirements:
1. Build an MVC Sinatra application.
    - follow Model, View, Controller style
    - separate responsibilities of different components

2. Use ActiveRecord with Sinatra.
    - retrieve data from our databases
    - persist data to our databases
    - set up models to inherit from ActiveRecord
        - 1. & 2. work together, used corneal to start foundations of app, inherit from sinatra in controller

3. Use multiple models. 
    - user model
    - another model
    - bonus: add another model for has_many_through

4. Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
    - has_many_through, will be a requirement in Rails
        - User has many coffees
        - Coffee belongs to user

5. Must have user accounts - users must be able to sign up, login, and logout.
    - sessions
    - user authentication
        - sign up:
            - take user to form in signup.erb
            - get '/signup' do
                erb :"users/signup"
              end
            - create the user with post route
            - post '/signup' do
                user = User.new(params)
                if user.username.blank? || user.email.blank? || user.password.blank? || user.first_name.blank? || user.last_name.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:usersame])
                    redirect '/signup'
                else
                    user.save
                    user.id = session[:user_id]
                    redirect '/coffees'
                end
              end
        - login:
            - take user to form in login.erb
            - get '/login' do
                erb :'users/login'
              end
            - process login form
            - post '/login' do
                user = User.find_by_username(params[:username])
                if user && user.authenticate(params[:password])
                     session[:user_id] = user.id
                     redirect '/coffees'
                else 
                    flash[:login_error] = "Invalid login, try again"
                    redirect '/login'
                end
              end
        - logout: 
            - clear session
            -  get '/logout' do
                session.clear
                redirect '/login'
              end
            - added logout link in footer

6. Validate uniqueness of user login attribute (username or email).
    - Active Record validations
    - 6. & 9. work together

7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
    - CRUD actions

8. Ensure that users can edit and delete only their own resources - not resources created by other users.
    - protect and secure users data
    - will do so with logging in user in and set users sessions, and retrieve currently logged in user
        - delete '/coffees/:id' do
                get_coffee
                if @coffee.user.id == current_user.id
                @coffee.destroy
                redirect '/coffees'
            else
                redirect '/coffees'
            end
        end

9. Validate user input so bad data cannot be persisted to the database.
    - not only pertaining to user log in and log out
    - add validations to form where user can create on object
        - user wants to submit form for new post, make sure user is submitting data and not empty form
        - will make database not have blank data
        - in coffee:
            - validates :name, :roaster, :producer, :variety, :process, :notes, presence: true
            = validates_presence_of :name, :roaster, :producer, :variety, :process, :notes
            - validates :name, uniqueness: true
            = validates_uniqueness_of :name
        - in user:
            - validates :username, :email, :password, :first_name, :last_name, presence: true
            = validates_presence_of :username, :email, :password, :first_name, :last_name
            - validates :username, :email, uniqueness: true
            = validates_uniqueness_of :username, :email

10. BONUS: Display validation failures to user with error messages (This is an optional feature, challenge yourself and give it a shot!)
    - error messages generated when validations return false (boolean value)