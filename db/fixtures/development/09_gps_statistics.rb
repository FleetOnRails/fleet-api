SeedFu.quiet = true

puts 'Seeding Gps Statistics'

cars = Car.all

cars.each do |car|
  gps_statistic = GpsStatistic.new(
      kmh: 100.0,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
  )

  if gps_statistic.valid?
    gps_statistic.save!
    car.gps_statistics << gps_statistic
    car.save!
    print '.'
  else
    print 'F'
  end
end

puts ''