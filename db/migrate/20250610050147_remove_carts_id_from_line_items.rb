class RemoveCartsIdFromLineItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :line_items, :carts_id, :integer
  end
end
