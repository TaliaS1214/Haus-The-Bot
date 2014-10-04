class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    add_column :items, :house_id, :integer
  end
end
