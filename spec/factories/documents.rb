# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title { Faker::Lorem.word }
    file 'file.pdf'
    data { Faker::Lorem.paragraph }
  end
end
