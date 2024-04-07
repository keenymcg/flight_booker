class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.datetime :departure_time
      t.datetime :arrival_time
      t.decimal :price
      t.references :departure_airport, foreign_key: { to_table: :airports }
      t.references :arrival_airport, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
