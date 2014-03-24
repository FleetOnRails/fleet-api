require 'faker'

SeedFu.quiet = true

puts 'Seeding Cars'

users = User.all

users.each do |user|
  car = Car.new(
      make: 'Toyota',
      model: 'Corolla',
      registration: Faker::Code.isbn
  )

  if car.valid?
    car.save!
    user.cars << car
    user.save!
    print '.'
  else
    print 'F'
  end
end

puts ''