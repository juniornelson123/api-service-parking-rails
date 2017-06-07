require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:payment){ build(:payment) }

  context 'verify fields' do
  	it { expect(payment).to respond_to(:date_expire) }	
  	it { expect(payment).to respond_to(:plan) }	
  	it { expect(payment.date_expire).to be_an_instance_of(Date) }
  end


  context 'validates model' do
  	it { is_expected.to  validate_presence_of(:date_expire)}
  end

  context 'relasionships model' do
    it { expect(payment).to belong_to(:plan) }
  	it { expect(payment).to belong_to(:user) }
  end

end
