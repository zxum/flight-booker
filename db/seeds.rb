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
  { code: 'JFK', location: 'New York City, New York', id: '2'},
  { code: 'DFW', location: 'Dallas, Texas', id: '3'},
  { code: 'PHL', location: 'Philadelphia, Pennsylvania', id: '4'},
])

flights = Flight.create([
  { time: '2021-11-20 17:00:00', duration: '05:20:00', to_airport_id: '1', from_airport_id: '2', id: '1' },
  { time: '2021-11-23 4:30:00', duration: '06:20:00', to_airport_id: '1', from_airport_id: '2', id: '5' },
  { time: '2021-11-21 13:00:00', duration: '07:10:00', to_airport_id: '3', from_airport_id: '2', id: '9' },
  { time: '2021-11-22 20:00:00', duration: '12:20:00', to_airport_id: '4', from_airport_id: '2', id: '13' },

  { time: '2021-11-21 6:00:00', duration: '05:20:00', to_airport_id: '2', from_airport_id: '1', id: '2' },
  { time: '2021-11-22 9:10:00', duration: '07:00:00', to_airport_id: '2', from_airport_id: '1', id: '6' },
  { time: '2021-11-23 10:17:00', duration: '08:40:00', to_airport_id: '4', from_airport_id: '1', id: '10' },
  { time: '2021-11-20 20:30:00', duration: '05:30:00', to_airport_id: '3', from_airport_id: '1', id: '14' },

  { time: '2021-11-20 12:00:00', duration: '03:55:00', to_airport_id: '3', from_airport_id: '4', id: '3' },
  { time: '2021-11-23 14:00:00', duration: '05:55:00', to_airport_id: '3', from_airport_id: '4', id: '7' },
  { time: '2021-11-21 23:30:00', duration: '04:00:00', to_airport_id: '1', from_airport_id: '4', id: '11' },
  { time: '2021-11-22 18:00:00', duration: '07:55:00', to_airport_id: '2', from_airport_id: '4', id: '15' },

  { time: '2021-11-22 11:00:00', duration: '04:00:00', to_airport_id: '4', from_airport_id: '3', id: '4' },
  { time: '2021-11-23 15:15:00', duration: '04:00:00', to_airport_id: '4', from_airport_id: '3', id: '8' },
  { time: '2021-11-21 18:44:00', duration: '05:30:00', to_airport_id: '2', from_airport_id: '3', id: '12' },
  { time: '2021-11-20 1:55:00', duration: '08:00:00', to_airport_id: '1', from_airport_id: '3', id: '16' }
])

p "Created #{Airport.count} airport entries and #{Flight.count} flight entries."