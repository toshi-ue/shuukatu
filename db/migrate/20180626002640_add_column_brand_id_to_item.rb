class AddColumnBrandIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :brand_id, :integer, null: false, after: :id
  end
end
