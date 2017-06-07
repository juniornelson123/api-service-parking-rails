require 'rails_helper'

#let(:user_params) { attributes_for(:user, email: "email_invalid@") }
#let(:user) { create(:user) }

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  
  context 'verify fields' do
  	it { expect(user).to respond_to(:email) }
  	it { expect(user).to respond_to(:password) }
  	it { expect(user).to respond_to(:password_confirmation) }
  	it { expect(user).to respond_to(:name) }
  	it { expect(user).to respond_to(:role) }
  end

  context 'validates model' do
  	it { is_expected.to validate_presence_of :email }
  	it { is_expected.to validate_presence_of :password }
  	it { is_expected.to validate_presence_of :name }
  end

  context 'relasionships model' do
  	it { is_expected.to have_many(:payments) }
  	it { is_expected.to have_many(:images) }
  end

  describe 'callbacks model' do
    let(:user_params) { attributes_for(:user) }
    let(:user) { create(:user) }

    context 'return callback before create' do
    	it 'create new user' do
    		expect(user.role).to eq(2)			
    	end		
    end

  end
end
