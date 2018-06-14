class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string   "order_no"
      t.integer  "user_id"
      t.string   "total_price"
      t.integer  "address_id"
      t.integer  "dvendor_id"
      t.string   "d_number"
      t.timestamps
    end
  end
end
