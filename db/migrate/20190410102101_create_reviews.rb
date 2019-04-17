class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :item
      t.references :user
      t.string :comment

      t.timestamps null: false
    end
  end
end
