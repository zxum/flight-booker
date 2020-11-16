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
        @matched_flights = Flight.all
      elsif params[:from_airport_id].blank?
        @matched_flights = Flight.where(to_airport_id: params[:to_airport_id])
      elsif params[:to_airport_id].blank?
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id])
      else
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id])
      end
    elsif !params[:day].blank? && !params[:month].blank? && !params[:year].blank?
      @matched_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      if params[:from_airport_id].blank? && params[:to_airport_id].blank?
        @matched_flights = Flight.where(time: @matched_date.all_day)
      elsif params[:from_airport_id].blank?
        @matched_flights = Flight.where(to_airport_id: params[:to_airport_id],time: @matched_date.all_day)
      elsif params[:to_airport_id].blank?
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id],time: @matched_date.all_day)
      else
        @matched_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], time: @matched_date.all_day)
      end
    else
      flash.now[:alert] = "Select a valid date!"
      redirect_to flights_path
    end
  end
end
