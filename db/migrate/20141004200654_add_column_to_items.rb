class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :perishable, :boolean
  end
end
