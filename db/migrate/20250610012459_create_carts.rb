class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.integer :session_id, null: false

      t.timestamps
    end
  end
end
