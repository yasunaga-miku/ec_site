class ChangeStatusDefaultOnBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :books, :status, 0
  end
end
