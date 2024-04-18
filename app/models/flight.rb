class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  # has_many :reservations
  has_many :bookings

  def self.search(departure_airport_id, arrival_airport_id, departure_date, passenger_count) 
    if departure_airport_id.present? && arrival_airport_id.present? && departure_date.present?
      where(departure_airport_id: departure_airport_id, 
            arrival_airport_id: arrival_airport_id, 
            departure_date: departure_date)
    else 
      all
    end
  end

  def duration
    ((arrival_time - departure_time) / 60).to_i
  end

  def departure_date_formatted
    departure_date.strftime('%B %d, %Y')
  end

  def departure_time_formatted
    departure_time.strftime('%I:%M %p')
  end

  def arrival_date_formatted
    arrival_date.strftime('%B %d, %Y')
  end

  def arrival_time_formatted
    arrival_time.strftime('%I:%M %p')
  end

end
