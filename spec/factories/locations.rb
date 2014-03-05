# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    latitude 1.5
    longitude 1.5
    address "MyString"
    city "MyString"
    county "MyString"
    country "MyString"
  end
end
