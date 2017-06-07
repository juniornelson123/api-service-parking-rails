require 'rails_helper'

RSpec.describe Image, type: :model do
	let(:image){ build(:image) }
	
	context 'fields exist' do
		it { expect(image).to respond_to(:image) }
		it { expect(image).to respond_to(:imageable_id) }
		it { expect(image).to respond_to(:imageable_type) }
	end

	context 'relasionship model' do
		it { expect(image).to belong_to(:imageable) }
	end
end
