class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.thank_you_email.subject
  #
  def thank_you_email(booking)
    @booking = booking
    
    @booking.passengers.each do |passenger|
      @passenger = passenger 
      mail to: @passenger.email, subject: "Thank you for Booking a Flight!"
    end
     
  end
end
