class CreateCartitems < ActiveRecord::Migration
  def change
    create_table :cartitems do |t|
      t.integer  "quantity"
      t.integer  "item_id"
      t.integer  "order_id"
      t.integer  "user_id"
      t.timestamps
    end
  end
end
