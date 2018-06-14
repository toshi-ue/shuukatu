class AddColumnGenreIdToGenre < ActiveRecord::Migration
  def change
    add_column :subgenres, :genre_id, :integer, null: false, after: :name
  end
end
