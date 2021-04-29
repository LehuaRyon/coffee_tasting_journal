class User < ActiveRecord::Base
    has_many :coffees

    methods I get:
    user.coffees
    
end