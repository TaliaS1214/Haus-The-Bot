class QuestionMarksFromAttrs < ActiveRecord::Migration
  def change
    remove_column :items, :perishable?
    remove_column :items, :bought?
    add_column :items, :bought, :boolean
  end
end
