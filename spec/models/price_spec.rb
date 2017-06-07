require 'rails_helper'

RSpec.describe Price, type: :model do
  	let(:price) { FactoryGirl.build(:price) }
	context 'verify exist fields' do

		it{expect(price).to respond_to(:hour)}
		it{expect(price).to respond_to(:price)}
		it{expect(price.hour).to be_an_instance_of(Float)}
		it{expect(price.price).to be_an_instance_of(Float)}
	
	end

	context 'validates model' do
		it{expect(price).to validate_presence_of :hour}
		it{expect(price).to validate_presence_of :price}
	end

	context 'relasionship model' do
		it { is_expected.to belong_to(:parking) }
	end
end
