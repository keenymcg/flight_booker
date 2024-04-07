# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create airports
# Airport.create(name: 'San Francisco International Airport', code: 'SFO', location: 'San Francisco, USA')
# Airport.create(name: 'John F. Kennedy International Airport', code: 'JFK', location: 'New York, USA')
# Airport.create(name: 'Los Angeles International Airport', code: 'LAX', location: 'Los Angeles, USA')
# Add more airports as needed

# Create flights
Flight.create(flight_number: 'UA 123', departure_time: '2024-04-08 08:00:00', arrival_time: '2024-04-08 12:00:00', price: 500, departure_airport_id: 1, arrival_airport_id: 2)
Flight.create(flight_number: 'AA 456', departure_time: '2024-04-08 10:00:00', arrival_time: '2024-04-08 14:00:00', price: 600, departure_airport_id: 2, arrival_airport_id: 1)
Flight.create(flight_number: 'DL 789', departure_time: '2024-04-08 12:00:00', arrival_time: '2024-04-08 16:00:00', price: 700, departure_airport_id: 1, arrival_airport_id: 3)

# The problem: "departure_airport_id: 1, arrival_airport_id: 2" corresponds to column names in the flight table, 
# but running rails db:seed causes an error that says "no such table: main.arrival_airports"
# This appears to be due to Rails trying to find a table named "arrival_airports" instead of "airports", when 
# the t.references doesn't immediately specify the table name. However, changing the t.references line to
# "t.references :airports, :arrival_airport, foreign_key: true" causes the same error that says "no such table: main.airports".
# The schema file also isn't updating -- after a  new migration is run -- to reflect the changes made to the migration file.
# I'm not sure if the schema file should be updating after a migration is run, but it didn't even update after
# running "rails db:schema:dump" to manually update it.

# @Scheals says: "If you pass in a second symbol to t.references, it adds that as a column - so you're basically adding two columns 
# in one go. First line creates airports_id and departure_airport_id, the second tried to create airports_id again and arrival_airport_id."

# I'm not even sure how the migration file plays into this, because the tables and their respective columns already exist. 
# I don't understand why it can't just dump the information from seeds.rb into the Flight database. 