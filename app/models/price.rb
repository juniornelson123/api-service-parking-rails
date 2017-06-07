class Price < ApplicationRecord
  belongs_to :parking

  validates_presence_of [:hour, :price]
end
