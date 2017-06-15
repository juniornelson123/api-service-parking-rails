class User < ApplicationRecord
  enum role:{customer: 1, admin: 2}	
  has_one :parking
	has_many :payments
	has_many :images, as: :imageable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_presence_of [:name]

	before_create :role_add

    def role_add
    	self.role = 1
    end

  def ensure_authentication_token
    if token.blank?
    self.token=generate_authentication_token
  end

  end

  def self.generate_authentication_token
    loop do 
      token=Devise.friendly_token
      break token unless User.find_by(token: token) 
  end

  end

end
