class AddColumnApprovalIdToSubgenres < ActiveRecord::Migration
  def change
    add_column :subgenres, :approval_id, :integer, after: :genre_id
  end
end
