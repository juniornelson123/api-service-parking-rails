class Parking < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  has_many :prices
  has_many :vagances

  validates_presence_of [:name,:description]
end
