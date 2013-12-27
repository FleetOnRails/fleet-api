# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.first_name Faker::Name.first_name
    f.last_name Faker::Name.last_name
    f.email Faker::Internet.email('alan')
    f.password 'password'
    f.password_confirmation 'password'
    f.phone_no Faker::PhoneNumber.cell_phone
    f.group_id Faker::Number.digit
    f.permission_level Faker::Number.digit
    f.username Faker::Internet.user_name('alan')
  end
end
