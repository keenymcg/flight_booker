class ChangeAirportCodesToBigInt < ActiveRecord::Migration[7.1]
  def change
    change_column :airports, :code, :bigint
  end
end
