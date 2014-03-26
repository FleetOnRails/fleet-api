# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :diagnostic_fault do
    fault_code { Faker::Address.zip }
    status true
  end
end
