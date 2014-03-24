require 'faker'

SeedFu.quiet = true

puts 'Seeding Locations'

(1..10).each do |i|
  begin
    Location.seed(:id, [{
                            id: i,
                            latitude: Faker::Address.latitude,
                            longitude: Faker::Address.longitude,
                            address: Faker::Address.street_address,
                            city: Faker::Address.city,
                            county: Faker::Address.state,
                            country: Faker::Address.country
                        }])
    print '.'
  rescue ActiveRecord::RecordNotSaved
    print 'F'
  end
end

puts ''