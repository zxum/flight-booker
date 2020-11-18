class FlightsController < ApplicationController

  # GET /flights
  # GET /flights.json
  def index
    @airport_options = Airport.all.map{ |a| [a.location, a.id] }.uniq
    @day_options = Flight.all.map{ |f| f.time.day }.uniq
    @month_options = Flight.all.map{ |f| f.time.month }.uniq
    @year_options = Flight.all.map{ |f| f.time.year }.uniq

    if params[:day].blank? && params[:month].blank? && params[:year].blank?
      if params[:from_airport_id].blank? && params[:to_airport_id].blank?
        @matched_flights = nil
      elsif params[:from_airport_id].blank?
        @matched_flights = Flight.where(to_airport_id: params[:to_airport_id])
      elsif params[:to_airport_id].blank?
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id])
      elsif params[:to_airport_id] == params[:from_airport_id]
        redirect_to flights_path, alert: "Please select a different destination from your origin."
      else
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id])
      end
    elsif !params[:day].blank? && !params[:month].blank? && !params[:year].blank?
      @matched_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      if params[:from_airport_id].blank? && params[:to_airport_id].blank?
        @matched_flights = Flight.where(time: @matched_date.all_day)
        flight_available(@matched_flights)
      elsif params[:from_airport_id].blank?
        @matched_flights = Flight.where(to_airport_id: params[:to_airport_id],time: @matched_date.all_day)
        flight_available(@matched_flights)
      elsif params[:to_airport_id].blank?
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id],time: @matched_date.all_day)
        flight_available(@matched_flights)
      elsif params[:to_airport_id] == params[:from_airport_id]
        redirect_to flights_path, alert: "Please select a different destination from your origin."
      else
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], time: @matched_date.all_day)
        flight_available(@matched_flights)
      end
    else
      redirect_to flights_path, alert: "Something went wrong. Please try again."
    end
  end

  private 
  def flight_available(flights)
    if flights.empty? 
      redirect_to flights_path, alert: "There are no flights available for your selection, please search again."
    else
      flights
    end
  end
end
