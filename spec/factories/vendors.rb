# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor do
    name { Faker::Company.name }
    supplies { Faker::Commerce.department }
    association :location, factory: :location
  end
end
