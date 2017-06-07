class Vagance < ApplicationRecord
	belongs_to :parking

	validates_presence_of [:status, :number]
end
