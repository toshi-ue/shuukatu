class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.string :customer_id

      t.timestamps
    end
  end
end
