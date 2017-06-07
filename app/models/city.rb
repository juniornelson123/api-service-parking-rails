class City < ApplicationRecord
	#Relasionship
	belongs_to :state
	has_many :addresses, as: :addressable, dependent: :destroy
	
	#Validates
	validates_presence_of :name
end
