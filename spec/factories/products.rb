# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price 1.5
    part_no { Faker::Code.isbn }
  end
end
