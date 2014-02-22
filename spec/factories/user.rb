# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.first_name Faker::Name.first_name
    f.last_name Faker::Name.last_name
    f.email Faker::Internet.email('alan')
    f.username Faker::Internet.user_name
    f.password Faker::Internet.password
    f.phone_no Faker::PhoneNumber.cell_phone
  end
end
