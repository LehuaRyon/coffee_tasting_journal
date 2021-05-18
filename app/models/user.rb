class User < ActiveRecord::Base
    
    has_many :coffees
    has_secure_password
    validates_presence_of :username, :email, :password, :first_name, :last_name
    validates_uniqueness_of :username, :email

end