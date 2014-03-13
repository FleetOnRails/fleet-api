# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'alan'
    last_name 'kehoe'
    email 'alankehoe111@gmail.com'
    username 'alan'
    password 'password'
    phone_no '0870608580'
  end
end
