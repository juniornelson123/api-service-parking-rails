class User < ApplicationRecord
	
	has_many :payments
	has_many :images, as: :imageable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_presence_of [:name]

	before_create :role_add

    def role_add
    	self.role = 2
    end
end
