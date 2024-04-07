class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.datetime :departure_time
      t.datetime :arrival_time
      t.decimal :price
      t.references :airports, :arrival_airport, foreign_key: true
      # t.references :airports, :departure_airport, foreign_key: true

      t.timestamps
    end
  end
end
