class AddCoordinatesToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :latitude, :float
    add_column :tours, :longitude, :float
  end
end
