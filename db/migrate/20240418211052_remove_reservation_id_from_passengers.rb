class RemoveReservationIdFromPassengers < ActiveRecord::Migration[7.1]
  def change
    remove_column :passengers, :reservation_id, :integer
  end
end
