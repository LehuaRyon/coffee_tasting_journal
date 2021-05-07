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
5. Must have user accounts - users must be able to sign up, sign in, and sign out.
    - sessions
    - user authentication
6. Validate uniqueness of user login attribute (username or email).
7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
    - CRUD actions
8. Ensure that users can edit and delete only their own resources - not resources created by other users.
    - protect and secure users data
    - will do so with logging in user in and set users sessions, and retrieve currently logged in user
9. Validate user input so bad data cannot be persisted to the database.
    - not only pertaining to user log in and log out
    - add validations to form where user can create on object
        - user wants to submit form for new post, make sure user is submitting data and not empty form
        - will make database not have blank data
10. BONUS: Display validation failures to user with error messages (This is an optional feature, challenge yourself and give it a shot!)
    - error messages generated when validations return false (boolean value)