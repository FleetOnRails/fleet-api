# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make { Faker::Name.first_name }
    model { Faker::Name.first_name }
    registration { Faker::Code.isbn }
  end
end
