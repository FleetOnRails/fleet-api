admin = User.new(
    first_name: 'Administrator',
    last_name: 'Administrator',
    email: 'admin@fleetonrails.eu',
    username: 'root',
    password: 'fleetonrails',
    password_confirmation: 'fleetonrails',
    admin: true
)

if admin.valid?
  admin.save!

  puts %q[
Administrator account created:

login.........admin@fleetonrails.eu
password......fleetonrails
]
end