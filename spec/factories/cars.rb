# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cars do
    make Faker::Commerce.product_name
    model Faker::Commerce.product_name
    registration Faker::Commerce.product_name
  end
end
