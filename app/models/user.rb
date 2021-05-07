class User < ActiveRecord::Base
    has_many :coffees
    # methods I get:
    # user.coffees
    # user.coffees << () shovel new coffee to user
    # user.coffees.build(hash of attributes)
    # user.coffees.create(hash of attributes)
    # enable model to be able to user autherntication
    has_secure_password
    # activerecord giv us this method
    # adds salt, to the user's password
    # salt = a randomized character string & user's password gets embedded in that string, hard to hack
    validates_presence_of :username, :email, :password, :first_name, :last_name
    validates_uniqueness_of :username, :email
    validates_associated :coffees 
end