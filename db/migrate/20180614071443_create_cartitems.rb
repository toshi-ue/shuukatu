class CreateCartitems < ActiveRecord::Migration
  def change
    create_table :cartitems do |t|

      t.timestamps null: false
    end
  end
end
