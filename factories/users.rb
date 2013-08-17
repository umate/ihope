FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'admin1234' }
  end
end
