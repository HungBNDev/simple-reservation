class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :card, null: false, foreign_key: true
      t.decimal :amount, null: false, precision: 12, scale: 2
      t.string :currency, null: false
      t.datetime :transaction_date

      t.timestamps
    end

    add_index :transactions, :transaction_date
  end
end
