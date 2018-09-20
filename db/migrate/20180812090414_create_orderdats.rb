class CreateOrderdats < ActiveRecord::Migration
  def change
    create_table :orderdats do |t|
      t.date :dat, null: false
      t.integer :sum_sales, null: false
      t.integer :sum_register, null: false
      t.timestamps
    end
  end
end
