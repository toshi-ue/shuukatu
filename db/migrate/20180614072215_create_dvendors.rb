class CreateDvendors < ActiveRecord::Migration
  def change
    create_table :dvendors do |t|

      t.timestamps null: false
    end
  end
end
