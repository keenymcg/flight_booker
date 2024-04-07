class AddCodeToAirports < ActiveRecord::Migration[7.1]
  def change
    # unless table_exists?(:airports)
      add_column :airports, :code, :string
    # end
  end
end
