class AddSoftDestroyedAtToYourModel < ActiveRecord::Migration
  def change
    add_column :your_models, :soft_destroyed_at, :datetime
    add_index :your_models, :soft_destroyed_at
  end
end
