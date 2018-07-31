class AddColumnCreditidToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :credit_id, :integer, after: :address_id
  end
end
