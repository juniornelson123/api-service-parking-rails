class City < ApplicationRecord
	#Relasionship
	belongs_to :state
	
	#Validates
	validates_presence_of :name
end
