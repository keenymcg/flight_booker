class Passenger < ApplicationRecord
  
  belongs_to :reservation # deprecated? Using booking instead of reservation?
  belongs_to :booking

end
