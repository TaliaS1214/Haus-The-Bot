class AddPurchasedDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :purchase_date, :datetime
  end
end
