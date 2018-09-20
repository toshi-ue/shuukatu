class CreateApprovalitems < ActiveRecord::Migration
  def change
    create_table :approvalitems do |t|
      t.integer :approval_id, index: true
      t.integer :item_id, index: true
      t.string :reason
      t.timestamps
    end
  end
end
