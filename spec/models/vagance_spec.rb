require 'rails_helper'

RSpec.describe Vagance, type: :model do
  let(:vagance) { FactoryGirl.build(:vagance) }
	context 'verify exist fields' do

		it{expect(vagance).to respond_to(:status)}
		it{expect(vagance).to respond_to(:number)}
	
	end

	context 'validates model' do
		it{expect(vagance).to validate_presence_of :status}
		it{expect(vagance).to validate_presence_of :number}
	end

	context 'relasionship model' do
		it { is_expected.to belong_to(:parking) }
	end
end
