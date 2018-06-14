class AddColumnsToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :title, :string, null: false, after: :id
    add_column :positions, :description, :string, null: false, after: :title
    add_column :positions, :address, :string, null: false, after: :description
    add_column :positions, :latitude, :float, null: false, after: :address
    add_column :positions, :longitude, :float, null: false, after: :latitude
  end
end
