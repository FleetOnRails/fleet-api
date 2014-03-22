SeedFu.quiet = true

puts 'Seeding Diagnostic Faults'

cars = Car.all

cars.each do |car|
  diagnostic_fault = DiagnosticFault.new(
      fault_code: Faker::Code.isbn,
      status: [true, false].sample
  )

  if diagnostic_fault.valid?
    diagnostic_fault.save!
    car.diagnostic_faults << diagnostic_fault
    car.save!
    print '.'
  else
    print 'F'
  end
end

puts ''