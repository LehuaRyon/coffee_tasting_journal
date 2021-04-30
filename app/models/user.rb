class User < ActiveRecord::Base
    has_many :coffees

    # methods I get:
    # user.coffees
    # user.coffees << () shovel new coffee to user
    # user.coffees.build(hash of attributes)
    # user.coffees.create(hash of attributes)

    # has many entries through coffees
    has_many :entries, through: coffees
    # user.entries

end