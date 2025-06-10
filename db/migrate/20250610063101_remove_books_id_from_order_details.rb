class RemoveBooksIdFromOrderDetails < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_details, :books_id, :integer
  end
end
