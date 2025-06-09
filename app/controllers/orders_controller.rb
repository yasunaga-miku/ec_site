class OrdersController < ApplicationController
  #注文画面
  def new
    @order = Order.new
    @book = Book.find(params[:book_id])
  end

  #注文内容の確認画面
  def confirm
    @order = Order.new(order_params)
    @book = Book.find(order_params[:book_id])
    #個数が未入力の場合は処理をスキップ
    unless @order.quantity.nil?
      puts 4
      @order.total = cal_total_price(@book.price, @order.quantity)
    end
  end

  #注文登録
  def create
    @order = Order.new(order_params)

    #注文が正常に保存できた場合
    if @order.save
      redirect_to complete_order_path(@order)
    else
      @book = Book.find(@order.book_id)
      render "new"
    end
  end

  #注文完了
  def complete
    @order = Order.find(params[:id])
    @book = Book.find(@order.book_id)
  end

  private

  #許可する注文パラメータの設定
  def order_params
    params.require(:order).permit(:total, :delivery_address, :quantity, :book_id)
  end

  #合計金額を計算
  def cal_total_price(price, quantity)
    return price * quantity
  end

end
