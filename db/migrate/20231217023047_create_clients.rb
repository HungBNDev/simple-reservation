class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :authentication_credentials, null: false
      t.decimal :payout_rate, precision: 10, scale: 2

      t.timestamps
    end

    add_index :clients, :name, unique: true
    add_index :clients, :authentication_credentials, unique: true
  end
end
