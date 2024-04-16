class FlightsController < ApplicationController

    def index
        
        # WORK ON THIS: FLIGHT DATES ISSUE. SEPARATE DATE FROM TIME IN MODEL. MIGHT HELP WITH FORM INPUTS
        @flights = Flight.all
        @flight_dates = Flight.pluck(:departure_time).map { |time| time.strftime("%m/%d/%Y") }.uniq

        @searched_flights = Flight.search(params[:departure_airport_id], params[:arrival_airport_id], 
        params[:flight_date], params[:passenger_count])
    end




    private

    def flight_params
        params.require(:flight).permit(:flight_number, :departure_time, :arrival_time, :price, :arrival_airport_id, :departure_airport_id)
    end

end