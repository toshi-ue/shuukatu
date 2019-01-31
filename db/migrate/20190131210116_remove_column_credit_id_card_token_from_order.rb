class RemoveColumnCreditIdCardTokenFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :credit_id
    remove_column :orders, :card_token
  end

  def down
    add_column :orders, :credit_id
    add_column :orders, :card_token
  end
end
