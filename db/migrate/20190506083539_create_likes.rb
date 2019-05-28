class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true, null: :false
      t.references :item, index: true, foreign_key: true, null: :false

      t.timestamps

      # t.index [:user_id, :item_id], unique: true
      t.index %i(user_id item_id), unique: true
    end
  end
end
