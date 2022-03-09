class AddCoordinatesToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :gadgets, :latitude, :float
    add_column :gadgets, :longitude, :float
    add_column :users, :address, :string
  end
end
