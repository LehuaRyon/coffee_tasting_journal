class Coffee < ActiveRecord::Base

    belongs_to :user
    validates_presence_of :name, :roaster, :producer, :variety, :process, :notes
	validates_uniqueness_of :name
   
end