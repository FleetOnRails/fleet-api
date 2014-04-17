# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title { Faker::Lorem.word }
    document Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/functional-spec.docx')))
  end
end
