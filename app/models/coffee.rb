class Coffee < ActiveRecord::Base
# belongs to user and entry
    # belongs_to :user
    # methods I get:
    # coffee.user / read the user that the coffee belongs to
    # coffee.user= / set the user that the coffee belongs to
    # coffee.build_user(hash of attributes)
    # coffee.create_user(hash of attributes)

    # belongs_to :entry
    # what kind of table is coffee: join table
end