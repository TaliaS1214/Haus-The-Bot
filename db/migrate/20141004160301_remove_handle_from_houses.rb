class RemoveHandleFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :handle
  end
end
