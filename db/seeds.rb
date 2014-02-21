# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'alan', first_name: 'alan', last_name: 'kehoe', email: 'alankehoe111@gmail.com',
            password: 'fleetonrails', password_confirmation: 'fleetonrails', admin: true)

User.create(username: 'krystian', first_name: 'krystian', last_name: 'jankowski', email: 'krystian.jankowski2@mail.dcu.ie',
            password: 'fleetonrails', password_confirmation: 'fleetonrails', admin: true)

