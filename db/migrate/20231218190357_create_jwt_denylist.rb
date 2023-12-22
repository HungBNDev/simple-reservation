class CreateJwtDenylist < ActiveRecord::Migration[7.1]
  def change
    create_table :jwt_denylists do |t|
      create_table :jwt_denylist do |t|
        t.string :jti, null: false
        t.datetime :exp, null: false
        t.timestamps
      end

      t.timestamps
    end
    add_index :jwt_denylist, :jti
  end
end
