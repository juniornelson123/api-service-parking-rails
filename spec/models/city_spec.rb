require 'rails_helper'

RSpec.describe City, type: :model do
	let(:city) { FactoryGirl.build(:city) }
	context 'verify exist fields' do

		it{expect(city).to respond_to(:name)}
		it{expect(city).to respond_to(:state_id)}
	
	end

	context 'validates model' do
		it{expect(city).to validate_presence_of :name}
	end

	context 'relasionship model' do
		it { is_expected.to belong_to(:state) }
	end
end
