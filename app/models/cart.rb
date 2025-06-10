class Cart < ApplicationRecord
    #関連付け(カートと商品)
    has_many :line_items
    has_many :books, through: :line_items

    #商品をカートに追加
    #すでにカートにある場合は数量を1増やし、新規の場合はLine_itemオブジェクトを作成
    def add_book(book)
        line_item = line_items.find_or_initialize_by(book: book)
        line_item.quantity += 1
        line_item.price += book.price
        line_item
    end

    #カート内の合計金額を計算
    def total_praice
        line_items.to_a.sum { |item| item.total_praice }
    end

    #カート内の合計個数を計算
    def total_quantity
        line_items.to_a.sum { |item| item.quantity }
    end

end
