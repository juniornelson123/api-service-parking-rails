FactoryGirl.define do
  factory :user do
    email 'junior@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    name 'junior'
  end
end
