class Payment < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  validates_presence_of :date_expire
end
