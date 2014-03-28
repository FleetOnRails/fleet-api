# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make { Faker::Name.first_name }
    model { Faker::Name.first_name }
    registration { Faker::Code.isbn }

    factory :car_with_diagnostic_statistics do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |car, evaluator|
        create_list(:diagnostic_statistic, evaluator.count, car: car)
      end

      # We can do the following with above factory
      # FactoryGirl.create(:car_with_diagnostic_statistics, count: 1500)
      # FactoryGirl.create(:car_with_diagnostic_statistics)
    end

  end
end
