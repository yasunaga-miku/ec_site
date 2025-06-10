class RemoveOrdersIdFromOrderDetails < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_details, :orders_id, :integer
  end
end
