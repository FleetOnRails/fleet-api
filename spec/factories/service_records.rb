# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_record do
    odometer_reading 100000
    technician { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    association :location, factory: :location
  end
end
