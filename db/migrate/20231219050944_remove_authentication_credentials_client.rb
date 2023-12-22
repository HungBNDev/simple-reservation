class RemoveAuthenticationCredentialsClient < ActiveRecord::Migration[7.1]
  def change
    remove_column :clients, :authentication_credentials
  end
end
