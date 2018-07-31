class AddColumnDefaultflgToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :defaultflg, :boolean, null: false, default: false, after: :others
  end
end
