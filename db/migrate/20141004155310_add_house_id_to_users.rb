class AddHouseIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :house, index: true
  end
end
