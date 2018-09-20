class CreateApprovalbrands < ActiveRecord::Migration
  def change
    create_table :approvalbrands do |t|
      t.integer :brand_id, index: true
      t.integer :approval_id
      t.string :reason
      t.timestamps
    end
  end
end
