class RemoveSessionidFromCarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :carts, :session_id, :integer
  end
end
