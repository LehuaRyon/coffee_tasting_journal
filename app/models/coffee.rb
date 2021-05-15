class Coffee < ActiveRecord::Base
# belongs to user and entry
    belongs_to :user
    # methods I get:
    # coffee.user / read the user that the coffee belongs to
    # coffee.user= / set the user that the coffee belongs to
    # coffee.build_user(hash of attributes)
    # coffee.create_user(hash of attributes)
    validates_presence_of :name, :roaster, :producer, :variety, :process, :notes
    # Validates that the specified attributes are not blank and, if the attribute is an association, that the associated object is not marked for destruction. Happens by default on save.
	validates_uniqueness_of :name
    # Validates whether the value of the specified attributes are unique across the system
    #  prevent bad data entry by users.
end