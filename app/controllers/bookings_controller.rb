class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @booking.passengers.build
  end

  def create

    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      redirect_to @booking
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :age, :gender])
  end

end
