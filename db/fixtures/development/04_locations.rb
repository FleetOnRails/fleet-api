SeedFu.quiet = true

puts 'Seeding Locations'

(1..10).each do

  location = Location.new(
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
  )

  if location.valid?
    location.save!
    print '.'
  else
    print 'F'
  end
end

puts ''