# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    county { Faker::Address.state }
    country { Faker::Address.country }
  end
end
