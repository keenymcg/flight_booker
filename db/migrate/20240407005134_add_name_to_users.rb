class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:users)
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
    end
  end
end
