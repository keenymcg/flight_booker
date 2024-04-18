class Passenger < ApplicationRecord
  
  # THIS WHOLE MODEL MAY BE DEPRECATED / USELESS, USING USER INSTEAD
  
  belongs_to :reservation # deprecated? Using booking instead of reservation
  belongs_to :booking

end
