# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_record do
    odometer_reading "MyString"
    technician "MyString"
    description "MyText"
  end
end
