# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    phone_no { Faker::PhoneNumber.cell_phone }
    created_at Time.now
    updated_at Time.now
    current_sign_in_at Time.now
    last_sign_in_at Time.now
  end
end
