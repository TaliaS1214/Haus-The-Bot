class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.text :password_digest
      t.timestamps
    end
  end
end
