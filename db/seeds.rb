# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.delete_all
Flight.delete_all

airports = Airport.create([
  { code: 'SFO', location: 'San Fransisco, California', id: '1'},
  { code: 'JFK', location: 'New York City, New York', id: '2'}
])

flights = Flight.create([
  { time: '2020-11-20 17:00:00', duration: '05:20:00', to_airport_id: '1', from_airport_id: '2', id: '1' },
  { time: '2020-11-21 6:00:00', duration: '05:20:00', to_airport_id: '2', from_airport_id: '1', id: '2' },
])