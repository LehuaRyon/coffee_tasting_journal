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
    Controller:
        - middle man between model and view
            - view and model should never directly communicate
        - responsible for handling requests & responding to those requests
        - define routes
        - define actions of routes when each route is requested
        - controller for every model so its easier to navigate, debug, organize code
Request/Response flows:
    Client = user is the requesting side
    Server = the application responding
        - this app is local server, not public
        - heroku is public domain w/public server
persist = adding data to database
models = singular
databases/tables = plural


