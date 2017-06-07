require 'rails_helper'

RSpec.describe Address, type: :model do
	let(:address) { FactoryGirl.build(:address) }
	context 'verify exist fields' do

		it{expect(address).to respond_to(:cep)}
		it{expect(address).to respond_to(:district)}
		it{expect(address).to respond_to(:number)}
		it{expect(address).to respond_to(:complement)}
		it{expect(address).to respond_to(:lat)}
		it{expect(address).to respond_to(:lng)}
		it{expect(address).to respond_to(:addressable_id)}
		it{expect(address).to respond_to(:addressable_type)}
	
	end

	context 'validates model' do
		it{is_expected.to validate_presence_of :cep}
		it{is_expected.to validate_presence_of :district}
		it{is_expected.to validate_presence_of :number}
	end

	context 'relasionship model' do
		it { is_expected.to belong_to(:addressable) }
		it { is_expected.to belong_to(:city) }
	end
end
