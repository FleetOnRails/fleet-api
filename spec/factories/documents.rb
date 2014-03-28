# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    name { Faker::Lorem.word }
    media { Faker::Lorem.paragraph }
  end
end
