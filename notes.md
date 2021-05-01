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
MVC = Model, View, Controller (separation of responsibilities)
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
    Controller:
        - middle man between model and view
            - view and model should never directly communicate
        - responsible for handling requests & responding to those requests
        - define routes
        - define actions of routes when each route is requested
        - controller for every model so its easier to navigate, debug, organize code
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

Request/Response flows:
    Client = user is the requesting side
    Server = the application responding
        - this app is local server, not public
        - heroku is public domain w/public server

Retrieve Params Data through:
    - URL
    - forms

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




