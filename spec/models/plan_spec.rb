require 'rails_helper'

RSpec.describe Plan, type: :model do
	let(:plan) { build(:plan) }
	
	context 'verify fields' do
		it { expect(plan).to respond_to(:name) }	
		it { expect(plan).to respond_to(:value) }	
		it { expect(plan).to respond_to(:description) }	
	end

	context 'validates model' do
		it { expect(plan).to validate_presence_of(:name) }
		it { expect(plan).to validate_presence_of(:description) }
		it { expect(plan).to validate_numericality_of(:value) }
	end

	context 'relasionships model' do
		it { expect(plan).to have_many(:payments) }
	end

end