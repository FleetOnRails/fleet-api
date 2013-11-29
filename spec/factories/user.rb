require 'faker'

# string  first_name
# string   last_name
# string   email
# text     address
# string   phone_number
# string   username
# string   password
# datetime created_at,   :null => false
# datetime updated_at

FactoryGirl.define do
  factory :user do |user|
    user.last_name { Faker::Name.last_name }
    user.email { Faker::Internet.email(Faker::Name.first_name) }
    user.address { Faker::Address.city }
    user.phone_number { Faker::PhoneNumber.cell_phone }
    user.username { Faker::Name.name }
    user.password { Faker::Internet.password }
    user.first_name { Faker::Name.first_name }
  end
end