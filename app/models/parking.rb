class Parking < ApplicationRecord
	enum status: { active: 1, disabled: 2, inactive: 3 }


  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  has_many :prices
  has_many :vagances

  validates_presence_of [:name,:description]

  before_create :set_status

  def set_status
  	self.status = 1
  end
end
