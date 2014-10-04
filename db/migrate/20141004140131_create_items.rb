class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.boolean :is_perishable?
      t.boolean :bought?
      t.timestamps
    end
  end
end
