class CreateManagersPositions < ActiveRecord::Migration
  def change
    create_table :managers_positions do |t|
      t.string :title
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :manager_id

      t.timestamps
    end
  end
end
