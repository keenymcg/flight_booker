class RemoveTimeFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :departure_time
    remove_column :flights, :arrival_time
  end
end
