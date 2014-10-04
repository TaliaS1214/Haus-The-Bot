class ChangePurchaseDateDataType < ActiveRecord::Migration
  def change
    change_column :items, :purchase_date, :date
  end
end
