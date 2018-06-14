class CreateDvendors < ActiveRecord::Migration
  def change
    create_table :dvendors do |t|
      t.string   "name"
      t.string   "for_api_name"
      t.timestamps
    end
  end
end
