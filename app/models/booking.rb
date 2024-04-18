class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flight
  has_many :passengers

  accepts_nested_attributes_for :passengers
end
