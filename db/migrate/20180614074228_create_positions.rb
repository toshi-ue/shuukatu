class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string   "title"
      t.string   "description"
      t.string   "address"
      t.float    "latitude"
      t.float    "longitude"
      t.timestamps
    end
  end
end
