class RenameIsPerishableForItems < ActiveRecord::Migration
  def change
    rename_column :items, :is_perishable?, :perishable?
  end
end
