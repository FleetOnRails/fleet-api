admin = User.new(
    first_name: 'Administrator',
    last_name: 'Administrator',
    email: 'alankehoe111@gmail.com',
    username: 'alan',
    password: 'fleetonrails',
    password_confirmation: 'fleetonrails',
    admin: true
)

if admin.valid?
  admin.save!

  puts %q[
Administrator account created:

login.........alankehoe111@gmail.com
password......fleetonrails
]
end

