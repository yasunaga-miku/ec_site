class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_name, null:false     #書籍名
      t.string :author_name, null:false   #著作名
      t.date :issue_date                  #発行日
      t.string :product_display           #商品表示
      t.integer :price, null:false        #価格
      t.integer :status, null:false       #注文ステータス

      t.timestamps                        #作成日時と更新日時
    end
  end
end
