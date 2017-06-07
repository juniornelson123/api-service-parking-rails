require 'rails_helper'

RSpec.describe Contact, type: :model do
	let(:contact) { FactoryGirl.build(:contact) }
	context 'verify exist fields' do

		it{expect(contact).to respond_to(:name)}
		it{expect(contact).to respond_to(:email)}
		it{expect(contact).to respond_to(:message)}
	
	end

	context 'validates model' do
		it{expect(contact).to validate_presence_of :name}
		it{expect(contact).to validate_presence_of :email}
		it{expect(contact).to validate_presence_of :message}
		it{expect(contact).to allow_value("junior123nelson@gmail.com").for(:email)}
	end

end
