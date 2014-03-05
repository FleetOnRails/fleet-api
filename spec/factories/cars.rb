# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cars do
    make 'toyota'
    model 'corolla'
    registration '05wx11013'
  end
end
