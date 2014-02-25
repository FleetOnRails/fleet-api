# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gps_datum, :class => 'GpsData' do
    latitude 1.5
    longitude 1.5
    mph 1.5
  end
end
