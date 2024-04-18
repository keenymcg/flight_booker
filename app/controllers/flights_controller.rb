class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        @flight_dates = Flight.pluck(:departure_date).map { |date| date.strftime("%m/%d/%Y") }.uniq
        @passenger_count = query_params[:passenger_count]
        @searched_flights = Flight.search(params[:departure_airport_id], params[:arrival_airport_id], 
        params[:departure_date], params[:passenger_count])
    end




    private

    def query_params
        params.permit(:flight_number, :departure_time, :arrival_time, 
        :arrival_airport_id, :departure_airport_id, 
        :departure_date, :arrival_date, :passenger_count,
        :commit, :authenticity_token)
    end

end