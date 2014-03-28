require 'faker'

SeedFu.quiet = true

puts 'Seeding Users'

krystian = User.new(
    first_name: 'Krystian',
    last_name: 'Jankowski',
    email: 'krystian.jankowski2@mail.dcu.ie',
    username: 'krystian',
    password: 'fleetonrails',
    password_confirmation: 'fleetonrails',
    admin: false
)

if krystian.valid?
  krystian.save!

  puts %q[
User account created:

login.........krystian.jankowski2@mail.dcu.ie
password......fleetonrails
]
end