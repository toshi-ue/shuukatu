class RemoveColumnSoftdestroyedatToUser < ActiveRecord::Migration
  def change
    remove_column :users, :soft_destroyed_at, :datetime, index: true, after: :encrypted_password
  end
end
