class CreateSubgenres < ActiveRecord::Migration
  def change
    create_table :subgenres do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
