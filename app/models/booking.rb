class Booking < ApplicationRecord
  
  belongs_to :flight

  has_many :passengers 


  def passengers_attributes=(passengers_attributes)
    passengers_attributes.each do |i, passenger_attributes|
      self.passengers.build(passenger_attributes)
    end
  end
end
