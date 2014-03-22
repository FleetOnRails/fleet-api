# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

username = 'admin'
password = 'fleetonrails'

User.create!({username: username, first_name: 'alan', last_name: 'kehoe', email: 'alan@fleetonrails.eu',
                      password: password, admin: true})

puts '####################################################'
puts '############# Welcome to FleetOnRails ##############'
puts '####################################################'
puts ''

puts "Admin user created successfully at #{Time.now}"
puts "Username: #{username}"
puts "Password: #{password}"

puts ''
puts '####################################################'
puts '####################################################'

