require 'rails_helper'

RSpec.describe State, type: :model do
  
  context 'verify exist fields' do
  	it { is_expected.to respond_to(:name) }	
  end

  context 'relasionship models' do
  	it { is_expected.to have_many(:cities) }
  end
end
