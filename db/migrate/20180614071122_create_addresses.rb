class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer  "user_id"
      t.string   "user_name"
      t.string   "name_kana"
      t.string   "tel"
      t.string   "postalcode"
      t.integer  "prefecture_id"
      t.string   "city"
      t.string   "street"
      t.string   "others"
      t.timestamps
    end
  end
end
