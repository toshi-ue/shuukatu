class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :status
      t.timestamps
    end
  end
end
