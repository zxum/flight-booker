require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "thank_you_email" do
    mail = BookingMailer.thank_you_email
    assert_equal "Thank you email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
