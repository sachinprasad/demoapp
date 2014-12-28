# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.all.count < 1
  User.create([{ first_name: 'Ajeet',last_name: "Kumar"},
               { first_name: 'Kumar',last_name: "Biswas"},
               { first_name: 'Kusar',last_name: "Kumar"},
               { first_name: 'Jack',last_name: "Prasad"},
               { first_name: 'Ankaj',last_name: "Kumar"},
               { first_name: 'Matt',last_name: "Reagan"},
               { first_name: 'Tom',last_name: "Hanks"}
             ])
end
