SeedFu.quiet = true

puts 'Seeding Diagnostic Statistics'

cars = Car.all

cars.each do |car|
  diagnostic_statistic = DiagnosticStatistic.new(
      kmh: 100.0,
      rpm: 1800,
      'l/100km' => 4.54
  )

  if diagnostic_statistic.valid?
    diagnostic_statistic.save!
    car.diagnostic_statistics << diagnostic_statistic
    car.save!
    print '.'
  else
    print 'F'
  end
end

puts ''