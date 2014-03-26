# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :destination do
    name { Faker::Company.name }
    association :location, factory: :location
  end
end
