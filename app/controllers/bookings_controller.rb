class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @chosen_flight = Flight.find(params[:flight_id])
    @no_of_passengers = params[:no_of_passengers].to_i
    @no_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    # raise booking_params.inspect
    if @booking.save 
      flash[:success] = 'Booking completed!'
      BookingMailer.thank_you_email(@booking).deliver_now
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'An error occured!'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private 
  
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end