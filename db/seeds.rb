# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

city = City.new({name: "Colorado Springs", population: 500000, state: "Colorado"})
city.save

city = City.new({name: "Boston", population: 700000, state: "Massachusettes"})
city.save

city = City.new({name: "New York", population: 8000000, state: "New York"})
city.save

city = City.new({name: "Seattle", population: 800000, state: "Colorado"})
city.save