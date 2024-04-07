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

