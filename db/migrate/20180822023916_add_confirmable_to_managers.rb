class AddConfirmableToManagers < ActiveRecord::Migration
  def up
    add_column :managers, :confirmation_token, :string
    add_column :managers, :confirmed_at, :datetime
    add_column :managers, :confirmation_sent_at, :datetime
    add_column :managers, :unconfirmed_email, :string
    add_index :managers, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    execute("UPDATE managers SET confirmed_at = NOW()")
  end
  def down
    remove_columns :managers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :managers, :unconfirmed_email # Only if using reconfirmable
  end
end
