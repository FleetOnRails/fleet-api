SeedFu.quiet = true

puts 'Seeding Users'

(2..20).each do
  user = User.new(
      username: Faker::Internet.user_name,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'fleetonrails',
      password_confirmation: 'fleetonrails',
      admin: false
  )

  if user.valid?
    user.save!
    print '.'
  else
    print 'F'
  end
end

puts ''