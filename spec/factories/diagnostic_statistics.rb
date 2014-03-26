# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :diagnostic_statistic do
    kmh 1.5
    rpm 1.5
    l100km 1.5
  end
end
