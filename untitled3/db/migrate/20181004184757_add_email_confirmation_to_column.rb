class AddEmailConfirmationToColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_con, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end
end
