# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@users = User.create([{ username: 'alan', first_name: 'alan', last_name: 'kehoe', email: 'alankehoe111@gmail.com',
              password: 'fleetonrails', admin: true },
             { username: 'krystian', first_name: 'krystian', last_name: 'jankowski', email: 'krystian.jankowski2@mail.dcu.ie',
              password: 'fleetonrails', admin: false }])

@group = Group.create(name: 'fleet')

@personal_car = Car.create(make: 'Toyota', model: 'Corolla', registration: '05wx11013')
@group_car = Car.create(make: 'Seat', model: 'Toledo', registration: '01cn1358')

@group.cars <<(@group_car)
User.first <<(@personal_car)
