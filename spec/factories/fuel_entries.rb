# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fuel_entry do
    odometer 1.5
    liters 1.5
    price 1.5
    type ""
    filled_tank false
    comment "MyText"
    filling_station "MyString"
  end
end
