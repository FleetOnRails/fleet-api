SeedFu.quiet = true

puts 'Seeding Service Records'

cars = Car.all

location = Location.first

cars.each do |car|

  service_record = ServiceRecord.new(
      odometer_reading: rand * (100000 - 10000) + 10000,
      technician: Faker::Name.name,
      description: Faker::Lorem.paragraph,
      location: location
  )

  if service_record.valid?
    service_record.save!
    car.service_records << service_record
    car.save!
    print '.'
  else
    print 'F'
  end
end

puts ''