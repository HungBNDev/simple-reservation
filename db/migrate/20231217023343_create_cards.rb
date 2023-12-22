class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :client, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :activation_number, null: false
      t.string :purchase_details_pin
      t.string :state, default: 'issued'

      t.timestamps
    end

    add_index :cards, :activation_number, unique: true
  end
end
