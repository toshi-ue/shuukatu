class AddColumnCardTokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_token, :string, after: :credit_id
  end
end
