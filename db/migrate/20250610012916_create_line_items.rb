class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :books_id, null: false
      t.integer :carts_id, null: false
      t.integer :quantity, null: false, default: 0
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
