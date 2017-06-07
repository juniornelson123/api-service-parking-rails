class Address < ApplicationRecord
	belongs_to :addressable, polymorphic: true
	belongs_to :city

	validates_presence_of [:cep, :district, :number]
end
