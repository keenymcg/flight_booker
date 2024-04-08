class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        @flight_dates = Flight.pluck(:departure_time).map { |time| time.strftime("%m/%d/%Y") }.uniq
    end


    private

    def flight_params
        params.require(:flight).permit(:flight_number, :departure_time, :arrival_time, :price, :arrival_airport_id, :departure_airport_id)
    end

end