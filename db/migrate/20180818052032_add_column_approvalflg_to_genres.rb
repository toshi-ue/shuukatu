class AddColumnApprovalflgToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :approval_id, :integer, after: :name
  end
end
