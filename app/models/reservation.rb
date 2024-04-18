class Reservation < ApplicationRecord
  
  # THIS WHOLE MODEL MAY BE DEPRECATED / USELESS, USING BOOKING INSTEAD
  
  belongs_to :user
  belongs_to :flight
  has_many :passengers
end
