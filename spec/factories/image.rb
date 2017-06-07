FactoryGirl.define do
	factory :image do
		image 'FFaker::Avatar::Image'
		imageable_id 1
		imageable_type 'type'
	end
end