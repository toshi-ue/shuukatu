class RemoveColumnToItem < ActiveRecord::Migration
  def change
    remove_column :items, :brand_id, :integer
  end
end
