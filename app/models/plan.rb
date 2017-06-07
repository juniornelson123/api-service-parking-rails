class Plan < ApplicationRecord
	has_many :payments
	
	validates_numericality_of :value
	validates_presence_of [:name, :description]
end
