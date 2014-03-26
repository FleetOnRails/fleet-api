# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gps_statistic do
    kmh 1.5
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
