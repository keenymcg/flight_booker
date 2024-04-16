class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  has_many :reservations

  def self.search(departure_airport_id, arrival_airport_id, flight_date, passenger_count) 
    if departure_airport_id.present? && arrival_airport_id.present? && flight_date.present?
      where(departure_airport_id: departure_airport_id, 
            arrival_airport_id: arrival_airport_id, 
            departure_time: flight_date)
    else 
      all
    end
  end

  # def self.search(params) 
  #   where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id], departure_time: params[:flight_date]).where('id NOT IN (?)', Reservation.pluck(:flight_id)).limit(params[:passenger_count])
  # end

  def duration
    ((arrival_time - departure_time) / 60).to_i
  end

end
