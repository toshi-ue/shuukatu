class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|

      t.timestamps null: false
    end
  end
end
