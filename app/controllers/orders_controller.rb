class OrdersController < ApplicationController
  #注文画面
  def new
    @order = Order.new
    @book = Book.find(params[:book_id])
    puts 1
  end

  #注文内容の確認画面
  def confirm
    puts 2
    @order = Order.new(order_params)
    puts 3
    @book = Book.find(order_params[:book_id])
    puts 4
    #個数が未入力の場合は処理をスキップ
    unless @order.quantity.nil?
      @order.total = cal_total_price(@book.price, @order.quantity)
    end
  end

  private

  #許可する注文パラメータの設定
  def order_params
    params.require(:order).permit(:total, :delivery_address, :book_id)
  end

  #合計金額を計算
  def cal_total_price(price, quantity)
    return price * quantity
  end

end
