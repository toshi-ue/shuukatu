class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer  "itemCodeNo"
      t.string   "partNumber"
      t.string   "itemName"
      t.integer  "genre_id"
      t.integer  "subgenre_id"
      t.float    "price"
      t.string   "description"
      t.string   "attention"
      t.string   "mainImage"
      t.string   "image2"
      t.string   "image3"
      t.timestamps
    end
  end
end
