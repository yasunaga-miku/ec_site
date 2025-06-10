class RemoveSessionIdFromCarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :carts, :seesion_id, :integer
  end
end
