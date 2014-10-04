class AddPinsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :pin, :string
  end
end
