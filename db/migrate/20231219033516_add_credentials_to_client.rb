class AddCredentialsToClient < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :email, :string
    add_column :clients, :encrypted_password, :string
  end
end
