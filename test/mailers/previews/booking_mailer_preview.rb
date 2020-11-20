# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/thank_you_email
  def thank_you_email
    booking = Booking.first
    BookingMailer.thank_you_email(booking)
  end

end
