class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.string :currency, null: false
      t.string :state, default: 'active'
      t.jsonb :custom_fields

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :state
  end
end
