What is sinatra?
    - is a web application framework, library that utilizes Ruby language to formulate a fuctioning web app on rack interface
        - rack is a middleware, bridge between sinatra code to render to user 
    - web application = encapsulates different urls to produce major app
    - websites = each individual url

What can I do with sinatra?
    - building a static(w/o having to persist data) or dynamic(submitting info & changing display based on info) web application
    - persist data if you add activerecord

Sinatra & Activerecord are two separate technologies, can work separately
    - powerful together, create application where you can have database management
    - user login, store users data to log back in, render homepage & data on homepage

DSL = Domain Specific Language
MVC = Minimum Viable Product (separation of responsibilities)
    Model:
        - blueprint for how each object is going to look like
        - how data in tables is going to be associated with one another
    View:
        - erb = embedded ruby, used to render(display) content to user
        - what renders data to user, everything that the user sees
        - text and styling
        - view for every CRUD action
        - separate views according to model being handled
        - combination of ERB & HTML
        - we have return each attribute of an object to show it
        - ERB tag: <% %> interpolate ruby code but user not meant to see
        - ERB tag: <%= %> interpolate ruby code that user can see
        - <a> tag: use to create links, href tag: where to go when link is clicked
        - <ul> tag: use to create unordered bulleted lists
        - <ol> tag: use to create ordered lists
        - id= : designated for css selectors, if using css selectors need to add id attribute to html tags
            - layout.erb:
                - content that renders on every page throughout application
                - a search form, a footer, menu bar, logout button, images
                - one location means less spelling errors and keeps code dry
                    - will yield to views 
                    - yield, run code till hits yield and run code for next function
                    - flash messages are great way to navigate user through application
                      <% flash.keys.each do |type| %>
                      <div data-alert class="flash <%= type %> alert-box radius">
                      <%= flash[type] %>
                      <a href="#" class="close">&times;</a>
                      </div>
                      <% end %>
                        - goes through each flash key, and for each one, it sets up an alert box and prints the text associated with that key
                        - going over flash hash and looking at keys and rendering key's value
                - <html> going to be using html code
                  <head> put dependencies I'm going to use
                  if going to use bootstrap, styling libraries, style sheets if using css, add cdn in head
                  <title>CoffeeTastingJournal</title> rendering text inside tab in application
        - forms:
            - action attribute: tells form where its going to post
            - method attribute: type of request being made
            - name= attribute (in input field): determines keys in params hash
                - we receive data from forms inside a params hash
                - returned as key/value pairs
                - keys, set on server side by me, values are what users fill out fields with 
    Controller:
        - middle man between model and view
            - view and model should never directly communicate
        - responsible for handling requests & responding to those requests
        - define routes
        - define actions of routes when each route is requested
        - controller for every model so its easier to navigate, debug, organize code
        - controller communicates with view page through instance variables
            - application controller:
                - define general routes
                - any route that does not involve a model
                - ex. root route, contact route, about route
                - order of routes really matters
        - HTTP Verbs:
            - get = show user something
            - post or patch = receiving data back from user
                - post = receiving info about new object, not already existing
                - put or patch = receiving edited info about existing object
        - .find vs .find_by_<attr>
            - .find: defaults to id, will return error if does not find user
            - .find_by: will return nil, won't break code or page
                - use in conditionals, if else
        - Create in (CRUD)
            - 1. show user form to fill out using http verb, get
            - 2. submit user's filled out form using http verb, post
        - Update in (CRUD)
            - Method override:
                - config.ru needs added:
                    - use Rack::MethodOverride
                - <form action="/coffees/<%= @@coffee.id %>" method="post"> 
                - <input type="hidden" name="_method" value="patch">
                    - can create requests aside from the defaulted post request
                    - replaces method= with value= request
        - Redirect:
            - making a new request, refreshing page
            - ex. use erb to display error messages, bc current session of page will stay open

Request/Response flows:
    Client = user is the requesting side
    Server = the application responding
        - this app is local server, not public
        - heroku is public domain w/public server

Get Params Data through: 
    - keep key names aligned with columns in database
        - two ways to create coffee object:
            - not needed bc of above: @coffee = Coffee.new(name: params[:name], roaster: params[:roaster], etc.)
            - simplified & better: @coffee = Coffee.new(params)
    - dynamic routes, URL
        - key will be stored inside of params hash
        - value is whatever was replacing placeholder
    - forms
        - retrieve data from user's submission
        - hack into params hash, pull out values
        - to do so we need key value pairing
            - define keys in input field name= attribute (severs side)
            - value is what user inputted in their form for that attribute (clients side)

persist = adding data to database
models = singular
databases/tables = plural

RESTful Routes (Representational State Transfer):
    - transferring all data back and forth based on requests beings made
    - does as a huge string
    - everything done on internet communicates through strings
    VERB:       ROUTE:      VIEW:       ACTION:
    Get         /posts      index       Read
    Get         /posts/:id  show        Read (dynamic route, :id is placeholder for value)
    Get         /posts/new  new         Create
    Post        /posts      No view     Create
    get         /posts/:id/edit  edit   update (dynamic route, :id replaced by :id of post being edited)
    put/patch   /posts/:id  No view     update (patch more accurate when changing couple attributes of object and not entire object itself)
    delete      /posts/:id  No view     delete

User Authentication:
    - ability for our user to sign up, login, and logout
    - keep track of our user: session
        - always return all of the objects that belong to that particular user
    - with bcrypt gem, needs a column called password_digest, not password
        - bcyrpt gives reader and writer for password
    - when user submits login form:
        - use parms hash with key/value pairs to authenticate and sign in user
Enable Sessions:
    - manipulate and access sessions to keep track of user
    - hash stores inside cookies, another hash
        - cookies shares info about currently logged in user's interactions with server
        - every time a user starts a new session, that session is stored inside of the cookie
    - with session hash, going to add own key value pair
        - key = attribute of user, usually user_id, email or username can also identify user session
Implement a User Model

Add Protection to Application:
    - Once user is logged in:
        - protect views for security and user experience
            - don't show a edit button if user cannot even edit it = bad user experience
        - protect route
    - more important for edit, update, and delete actions
        - dont want another user to delete, edit, or manipulate a users items
     
    


