class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # # Associations
  # has_many :reservations # deprecated? Using bookings instead of reservations
  # has_many :flights, through: :reservations
  
  has_many :bookings
  has_many :flights, through: :bookings

end
