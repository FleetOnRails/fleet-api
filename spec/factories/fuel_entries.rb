# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fuel_entry do
    odometer 1.5
    liters 1.5
    price 1.5
    fuel_type %w(Diesel Petrol).sample
    filled_tank true
    date Time.now
    comment { Faker::Lorem.paragraph }
    filling_station { Faker::Company.name }
    association :location, factory: :location
  end
end