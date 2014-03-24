require 'faker'

SeedFu.quiet = true

puts 'Seeding Fuel Entries'

cars = Car.all

cars.each do |car|
  fuel_entry = FuelEntry.new(
      odometer: rand * (100000 - 10000) + 10000,
      liters: rand * (60 - 5) + 5,
      price: rand * (1.75 - 1.45) + 1.45,
      fuel_type: ['Petrol, Diesel'].sample,
      filling_station: Faker::Company.name,
      filled_tank: [true, false].sample
  )

  if fuel_entry.valid?
    fuel_entry.save!
    car.fuel_entries << fuel_entry
    car.save!
    print '.'
  else
    print 'F'
  end
end

puts ''