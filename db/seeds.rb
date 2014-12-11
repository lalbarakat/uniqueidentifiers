# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@test.com', firstname: 'John', lastname: 'Smith', password: 'password', username: 'test')
Item.create(name: 'Camera 1', category: 'Cameras')
Item.create(name: 'Camera 2', category: 'Cameras')

