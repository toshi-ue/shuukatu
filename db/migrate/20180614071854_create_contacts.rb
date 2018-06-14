class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer  "quantity"
      t.integer  "item_id"
      t.integer  "order_id"
      t.integer  "user_id"
      t.timestamps
    end
  end
end
