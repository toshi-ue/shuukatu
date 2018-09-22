class DropApprovalbrand < ActiveRecord::Migration
  def change
    drop_table :approvalbrands
  end
end
