# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

15.times do
    Airport.create(
        name: Faker::Travel::Airport.unique.name(size: 'large', region: 'united_states'),
        code: rand(100..999),
        location: Faker::Address.city_with_state
    )
end

15.times do
    departure_airport_id = rand(1..15)
    arrival_airport_id = (departure_airport_id % 15) + 1 # Ensure arrival is different from departure
    
    Flight.create(
        flight_number: Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3).upcase,
        departure_date: '2024-04-18',
        departure_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
        arrival_date: '2024-04-18',
        arrival_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
        price: Faker::Number.between(from: 300, to: 800),
        departure_airport_id: departure_airport_id,
        arrival_airport_id: arrival_airport_id
    )
end

# Create airports
Airport.create(name: 'San Francisco International Airport', code: 111, location: 'San Francisco, USA')
Airport.create(name: 'John F. Kennedy International Airport', code: 222, location: 'New York, USA')
Airport.create(name: 'Los Angeles International Airport', code: 333, location: 'Los Angeles, USA')
# Add more airports as needed

# Create flights
Flight.create(flight_number: 'UA123', departure_date: '2024-04-18', departure_time: '08:00:00', arrival_date: '2024-04-18', arrival_time: '12:00:00', price: 500, departure_airport_id: 16, arrival_airport_id: 17)
Flight.create(flight_number: 'AA456', departure_date: '2024-04-18', departure_time: '10:00:00', arrival_date: '2024-04-18', arrival_time: '14:00:00', price: 600, departure_airport_id: 17, arrival_airport_id: 16)
Flight.create(flight_number: 'DL789', departure_date: '2024-04-18', departure_time: '12:00:00', arrival_date: '2024-04-18', arrival_time: '16:00:00', price: 700, departure_airport_id: 16, arrival_airport_id: 18)


p "Created #{Airport.count} airports"
p "Created #{Flight.count} flights"