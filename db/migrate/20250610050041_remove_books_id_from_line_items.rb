class RemoveBooksIdFromLineItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :line_items, :books_id, :integer
  end
end
