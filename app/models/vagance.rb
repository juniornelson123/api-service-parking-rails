class Vagance < ApplicationRecord

	enum status: { open: 1, close: 2}

	belongs_to :parking

	validates_presence_of [:number]

	before_create :set_status

	def set_status
		self.status = 1		
	end
end
