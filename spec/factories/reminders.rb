# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder do
    date Time.now
    odometer 1.5
    reminder_type { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
