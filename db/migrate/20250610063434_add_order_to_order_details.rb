class AddOrderToOrderDetails < ActiveRecord::Migration[7.1]
  def change
    add_reference :order_details, :order, null: false, foreign_key: true
  end
end
