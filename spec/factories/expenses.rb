# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    date Time.now
    odometer 100100
    price 160
    type 'service'
    description { Faker::Lorem.paragraph }
    association :location, factory: :location
  end
end
