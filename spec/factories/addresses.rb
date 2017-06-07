FactoryGirl.define do
  factory :address do
    cep "MyString"
    district "MyString"
    number "MyString"
    complement "MyString"
    lat 1
    lng 1
    addressable_id 1
    addressable_type "MyString"
  end
end
