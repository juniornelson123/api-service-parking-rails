require 'rails_helper'

RSpec.describe Parking, type: :model do
  	let(:parking) { FactoryGirl.build(:parking) }
	context 'verify exist fields' do

		it{expect(parking).to respond_to(:name)}
		it{expect(parking).to respond_to(:description)}
		it{expect(parking).to respond_to(:user_id)}
	
	end

	context 'validates model' do
		it{expect(parking).to validate_presence_of :name}
		it{expect(parking).to validate_presence_of :description}
	end

	context 'relasionship model' do
		it { is_expected.to belong_to(:user) }
		it { is_expected.to have_one(:address) }
		it { is_expected.to have_many(:prices) }
		it { is_expected.to have_many(:vagances) }
	end
end
