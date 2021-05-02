class User < ActiveRecord::Base
    # has_many :coffees

    # methods I get:
    # user.coffees
    # user.coffees << () shovel new coffee to user
    # user.coffees.build(hash of attributes)
    # user.coffees.create(hash of attributes)

    # has many entries through coffees
    # has_many :entries, through: coffees
    # user.entries
    # validates_presence_of :username, :email, :password, :first_name, :last_name
	# validates_uniqueness_of :username, :email
    # enable model to be able to user autherntication
    has_secure_password
    # activerecord giv us this method
    # adds salt, to the user's password
    # salt = a randomized character string & user's password gets embedded in that string, hard to hack
end